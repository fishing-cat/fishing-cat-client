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
        FishingCat::Client.setup(config:config)
        mails.each do |to|
          pid = Hashids.new(config['salt'], 0, 'abcdefghijklmnopqrstuvwxyz').encode(SecureRandom.random_number(2**64))
          deliver(to:to, cid:cid, pid:pid, config:config)
        end
      end

      no_commands do
        def deliver(cid:, pid:, to:, config:)
          message = FishingCat::Client::Mailer.create(cid:cid, pid:pid, config:config.merge({
            'header' => {
              'to' => to
            }
          }))
          # message.deliver_now
          $stdout.puts "#{cid}\t#{pid}\t#{to}"
          # $stderr.puts message.body
        end
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
