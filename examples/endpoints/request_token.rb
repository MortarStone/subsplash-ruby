# frozen_string_literal: true

require 'pry'
require 'date'
require 'active_support/inflector'
require 'bigdecimal'
require_relative '../../lib/subsplash'
require_relative '../print_helper'

require 'dotenv'
Dotenv.load(File.join(__dir__, '..', '..', '.env'))

requester = Subsplash::TokenRequester.new(
  ENV.fetch('CLIENT_ID', nil),
  ENV.fetch('CLIENT_SECRET', nil)
)
p requester.new_token
puts
