require 'simple_currency'

module RbtcArbitrage
  module Clients
    class CaVirtexClient
      include RbtcArbitrage::Client

      # return a symbol as the name
      # of this exchange
      def exchange
        :cavirtex
      end

      # Returns an array of Floats.
      # The first element is the balance in BTC;
      # The second is in USD.
      def balance
        [ 0.0, 0.0 ]
      end

      # Configures the client's API keys.
      def validate_env
        # TODO
      end

      # `action` is :buy or :sell
      def trade action

      end

      # `action` is :buy or :sell
      # Returns a Numeric type.
      def price action
        @price ||= begin
          response = HTTParty.get('https://www.cavirtex.com/api/CAD/ticker.json')
          prices = JSON.load(response.parsed_response)
          prices['last'].to_f.cad.to_usd
        end
      end

      # Transfers BTC to the address of a different
      # exchange.
      def transfer client

      end

      # If there is an API method to fetch your
      # BTC address, implement this, otherwise
      # remove this method and set the ENV
      # variable [this-exchange-name-in-caps]_ADDRESS
      def address
        'TESTING'
      end
    end
  end
end