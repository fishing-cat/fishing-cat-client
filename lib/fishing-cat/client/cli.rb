require 'thor'
require 'fishing-cat/client'
require 'fishing-cat/client/mailer'
require 'yaml'

module FishingCat
  module Client
    class Campaign < Thor
      desc :test, 'Test'
      def test
        config = YAML.load_file('tmp/config.yml')
        FishingCat::Client.setup(config)
        message = FishingCat::Client::Mailer.create(config)
        puts message.body
        # message.deliver_now
      end
    end
  end
end

module FishingCat
  module Client
    class CLI < Thor
      register(Campaign, :campaign, :campaign, 'Campaign')
    end
  end
end
