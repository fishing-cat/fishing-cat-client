require 'active_support'
require 'action_mailer'

module FishingCat
  module Client

    def self.setup(config)
      params = {
        prepend_view_path: config[:prepend_view_path],
        delivery_method: config[:delivery_method]&.to_sym,
        smtp_settings: config[:smtp_settings],
      }
      ActionMailer::Base.prepend_view_path(params[:prepend_view_path])
      ActionMailer::Base.delivery_method = params[:delivery_method]
      ActionMailer::Base.smtp_settings = params[:smtp_settings]
    end

    class Mailer < ActionMailer::Base
      def create(params)
        @phishing_image_name = params[:phishing_image_name]
        @phishing_image_url = params[:phishing_image_url]
        @phishing_form_name = params[:phishing_form_name]
        @phishing_form_url = params[:phishing_form_url]
        mail(params)
      end
    end
  end
end
