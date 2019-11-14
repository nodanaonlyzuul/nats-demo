# frozen_string_literal: true
require 'rubygems'
require 'nats/client'
require 'json'

LETTERS = ('a'..'z').to_a
NUMBERS = (1..1000).to_a

NATS.start do
  100.times do
    letter_message = JSON.generate({favoriteLetter: LETTERS.sample})
    number_message = JSON.generate({favoriteNumber: NUMBERS.sample})

    NATS.publish('favorite.number', number_message)
    NATS.publish('favorite.letter', letter_message)
  end
  puts 'done'
end
