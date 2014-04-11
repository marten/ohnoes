require 'appsignal'

module Ohnoes
  class FrontendFormatter < Appsignal::Transaction::Formatter
    def add_exception_to_hash!
      hash[:exception] = {
          :exception => exception.js_class,
          :message => exception.message,
          :backtrace => clean_backtrace(exception)
      }
    end
  end
end
