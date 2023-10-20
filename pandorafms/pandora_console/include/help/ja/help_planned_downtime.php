<?php
/**
 * @package Include/help/ja
 */
?>
<h1>計画停止</h1>

<p>
このインタフェースでは、モニタリングしない時間の設定します。
例えば、特定の時間帯にあるグループのシステムが停止する場合に、障害検知をしないようにするのに便利です。
</p>
<p>
設定はとても簡単で、名前を入力し、開始日時、終了日時、対象となるグループを設定するのみです。
説明には任意の文章を入力できます。
</p>
<p>
計画停止時間が来ると、<?php echo get_product_name(); ?> は自動的に該当するすべてのエージェントのアラートやデータ収集を停止します。
その時間が終了すると、該当する全てのエージェントを有効に戻します。
計画停止時間になると、該当する設定は削除や編集ができなくなります。
削除・編集には、計画停止時間の終了を待つ必要があります。
ただし、エージェント管理画面からは、各エージェントを手動で有効に変更することはできます。
</p>