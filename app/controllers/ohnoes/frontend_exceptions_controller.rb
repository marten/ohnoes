module Ohnoes
  class FrontendExceptionsController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def create
      notice = Hash.from_xml(CGI.unescape(request.body.read))

      error = notice["notice"]["error"]
      backtrace = error["backtrace"]["line"]
      backtrace = [backtrace] unless backtrace.is_a? Array

      frontend_exception = FrontendException.new(error["class"], error["message"], backtrace)

      # inlined somewhat from Appsignal::Rack::Listener
      key = SecureRandom.uuid

      transaction = Appsignal::Transaction.new(key, env)
      Appsignal.transactions[key] = transaction

      event = ActiveSupport::Notifications::Event.new('frontend_action', Time.now, Time.now, key, raw_payload(env))
      transaction.set_process_action_event(event)


      transaction.add_exception(frontend_exception)
      transaction.set_tags(frontend_exception: 'frontend_exception')

      def transaction.to_hash
        FrontendFormatter.new(self).to_hash
      end

      transaction.complete!

      render json: notice
    end

    def raw_payload(env)
      request = ::Rack::Request.new(env)
      {
          :controller => "foocontroller",
          :action => "baraction",
          :params => request.params,
          :method => request.request_method,
          :path   => request.path
      }
    end

  end
end
