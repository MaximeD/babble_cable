module Lita
  module Adapters
    class BabbleCable < Adapter
      config :channels, type: Array
      config :api_token do
        validate do |value|
         # "must be 10 characters" unless value.respond_to?(:size) && value.size == 10
        end
      end

      Lita.register_adapter(:babble_cable, self)
    end
  end
end
