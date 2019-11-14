# frozen_string_literal: true
require 'rubygems'
require 'nats/client'
require 'json'

LETTERS = ('a'..'z').to_a
NUMBERS = (1..1000).to_a

NATS.start do
   # Adding queue: 'name' makes it act like a queue, default is fanout
   NATS.subscribe('favorite.number') { |msg| puts "favoriteNumber received : '#{JSON.parse(msg)['favoriteNumber']}'" }
end
