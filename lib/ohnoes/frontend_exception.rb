module Ohnoes
  class FrontendException < StandardError
    attr_reader :js_class
    def initialize(klass, message, backtrace)
      @js_class = klass
      @js_message = message
      @js_backtrace = backtrace
    end

    def message
      @js_message
    end

    def backtrace
      @js_backtrace.map do |line|
        line['file'] + ':' + line['number'] + ': in `' + line['method'] + "'"
      end
    end
  end
end
