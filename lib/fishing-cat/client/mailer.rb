require 'active_support'
require 'action_mailer'

module FishingCat
  module Client

    def self.setup(config)
      params = {
        prepend_view_path: config['mua']['prepend_view_path'],
        delivery_method: config['mua']['delivery_method']&.to_sym,
        smtp_settings: config['mua']['smtp_settings'],
      }
      ActionMailer::Base.prepend_view_path(params[:prepend_view_path])
      ActionMailer::Base.delivery_method = params[:delivery_method]
      ActionMailer::Base.smtp_settings = params[:smtp_settings]
    end

    class Mailer < ActionMailer::Base
      def create(config)
        @phishing_image_name = config['body']['phishing_image_name']
        @phishing_image_url = config['body']['phishing_image_url']
        @phishing_form_name = config['body']['phishing_form_name']
        @phishing_form_url = config['body']['phishing_form_url']
        params = {
          subject: config['header']['subject'],
          from: config['header']['from'],
          to: config['header']['to'],
          template_path: config['mua']['template_path'],
          template_name: config['mua']['template_name'],
        }
        mail(params)
      end
    end

  end
end
