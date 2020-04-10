module RuboCop
  module Cop
    module Rspec
      class AddContext < RuboCop::Cop::Cop
        MSG = 'Please describe your tests or add an explicit context.'.freeze

        def on_send(node)
          
        end
      end
    end
  end
end
