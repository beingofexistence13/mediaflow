# frozen_string_literal: true

require "discordrb/webhooks"

module Integrations
  class Discord < BaseChatNotification
    ATTACHMENT_REGEX = /: (?<entry>.*?)\n - (?<name>.*)\n*/

    field :webhook,
      section: SECTION_TYPE_CONNECTION,
      help: 'e.g. https://discord.com/api/webhooks/…',
      required: true

    field :notify_only_broken_pipelines,
      type: :checkbox,
      section: SECTION_TYPE_CONFIGURATION

    field :branches_to_be_notified,
      type: :select,
      section: SECTION_TYPE_CONFIGURATION,
      title: -> { s_('Integrations|Branches for which notifications are to be sent') },
      choices: -> { branch_choices }

    def title
      s_("DiscordService|Discord Notifications")
    end

    def description
      s_("DiscordService|Send notifications about project events to a Discord channel.")
    end

    def self.to_param
      "discord"
    end

    def help
      docs_link = ActionController::Base.helpers.link_to _('How do I set up this service?'), Rails.application.routes.url_helpers.help_page_url('user/project/integrations/discord_notifications'), target: '_blank', rel: 'noopener noreferrer'
      s_('Send notifications about project events to a Discord channel. %{docs_link}').html_safe % { docs_link: docs_link.html_safe }
    end

    def default_channel_placeholder
      s_('DiscordService|Override the default webhook (e.g. https://discord.com/api/webhooks/…)')
    end

    override :supported_events
    def supported_events
      additional = group_level? ? %w[group_mention group_confidential_mention] : []

      (self.class.supported_events + additional).freeze
    end

    def self.supported_events
      %w[push issue confidential_issue merge_request note confidential_note tag_push pipeline wiki_page deployment]
    end

    def configurable_channels?
      true
    end

    def channel_limit_per_event
      1
    end

    def mask_configurable_channels?
      true
    end

    private

    def notify(message, opts)
      webhook_url = opts[:channel]&.first || webhook
      client = Discordrb::Webhooks::Client.new(url: webhook_url)

      client.execute do |builder|
        builder.add_embed do |embed|
          embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: message.user_name, icon_url: message.user_avatar)
          embed.description = (message.pretext + "\n" + Array.wrap(message.attachments).join("\n")).gsub(ATTACHMENT_REGEX, " \\k<entry> - \\k<name>\n")
          embed.colour = embed_color(message)
          embed.timestamp = Time.now.utc
        end
      end
    rescue RestClient::Exception => e
      log_error(e.message)
      false
    end

    COLOR_OVERRIDES = {
      'good' => '#0d532a',
      'warning' => '#703800',
      'danger' => '#8d1300'
    }.freeze

    def embed_color(message)
      return 'fc6d26'.hex unless message.respond_to?(:attachment_color)

      color = message.attachment_color

      color = COLOR_OVERRIDES[color] if COLOR_OVERRIDES.key?(color)

      color = color.delete_prefix('#')

      normalize_color(color).hex
    end

    # Expands the short notation to the full colorcode notation
    # 123456 -> 123456
    # 123    -> 112233
    def normalize_color(color)
      return (color[0, 1] * 2) + (color[1, 1] * 2) + (color[2, 1] * 2) if color.length == 3

      color
    end

    def custom_data(data)
      super(data).merge(markdown: true)
    end
  end
end
