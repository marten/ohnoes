require 'rails'

module Ohnoes
  class Engine < Rails::Engine
    isolate_namespace Ohnoes
  end
end
