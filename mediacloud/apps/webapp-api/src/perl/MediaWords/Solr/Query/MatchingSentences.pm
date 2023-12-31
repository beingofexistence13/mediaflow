package MediaWords::Solr::Query::MatchingSentences;

use strict;
use warnings;

use Modern::Perl "2015";
use MediaWords::CommonLibs;

use List::MoreUtils qw(natatime);

use MediaWords::Solr;
use MediaWords::Solr::Query::Parse;


# order the list of sentences by the given list of stories_ids
sub _order_sentences_by_stories_ids($$)
{
    my ( $stories_ids, $story_sentences ) = @_;

    my $ss = {};
    map { push( @{ $ss->{ $_->{ stories_id } } }, $_ ) } @{ $story_sentences };

    my $ordered_sentences = [];
    map { push( @{ $ordered_sentences }, @{ $ss->{ $_ } } ) if ( $ss->{ $_ } ) } @{ $stories_ids };

    return $ordered_sentences;
}

# Query for solr for stories matching the given query, then return all sentences within those stories that match
# the the inclusive regex translation of the solr query.  The inclusive regex is the regex generated by translating
# the solr boolean query into a flat list of ORs, so  [ ( foo and bar ) or baz ] would get translated first into
# [ foo or bar or baz ] and then into a regex.
#
# Order the sentences in the same order as the list of stories_ids returned by solr unless $random_limit is specified.
# If $random_limit is specified, return at most $random_limit stories, randomly sorted.

sub query_matching_sentences($$;$)
{
    my ( $db, $params, $random_limit ) = @_;

    my $stories_ids = MediaWords::Solr::search_solr_for_stories_ids( $db, $params );

    # sort stories_ids so that chunks below will pull close blocks of stories_ids where possible
    $stories_ids = [ sort { $a <=> $b } @{ $stories_ids } ];

    return [] unless ( @{ $stories_ids } );

    die( "too many stories (limit is 1,000,000)" ) if ( scalar( @{ $stories_ids } ) > 1_000_000 );

    my $re_clause = 'true';

    my $re = eval { '(?isx)' . MediaWords::Solr::Query::Parse::parse_solr_query( $params->{ q } )->inclusive_re() };
    if ( $@ )
    {
        if ( $@ !~ /McSolrEmptyQueryException/ )
        {
            die( "Error translating solr query to regex: $@" );
        }
    }
    else
    {
        $re_clause = "sentence ~ " . $db->quote( $re );
    }

    my $order_limit;
    if ($random_limit) {
        $order_limit = "ORDER BY RANDOM() LIMIT $random_limit";
    } else {
        $order_limit = 'ORDER BY sentence_number';
    }

    # postgres decides at some point beyond 1000 stories to do this query as a seq scan
    my $story_sentences   = [];
    my $stories_per_chunk = 1000;
    my $iter              = natatime( $stories_per_chunk, @{ $stories_ids } );
    while ( my @chunk_stories_ids = $iter->() )
    {
        my $ids_table = $db->get_temporary_ids_table( \@chunk_stories_ids );

        my $chunk_story_sentences = $db->query( <<SQL
            SELECT
                ss.sentence,
                ss.media_id,
                ss.publish_date,
                ss.sentence_number,
                ss.stories_id,
                ss.story_sentences_id,
                ss.language,
                s.language AS story_language
            FROM story_sentences AS ss
                JOIN stories AS s USING (stories_id)
                JOIN $ids_table AS ids ON s.stories_id = ids.id
            WHERE $re_clause
            $order_limit
SQL
        )->hashes;
        push( @{ $story_sentences }, @{ $chunk_story_sentences } );
    }

    if ( $random_limit ) {
        return $story_sentences;
    } else {
        return _order_sentences_by_stories_ids( $stories_ids, $story_sentences );
    }
}

1;
