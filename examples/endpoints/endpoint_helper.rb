# frozen_string_literal: true

require 'pry'
require 'date'
require 'active_support/inflector'
require 'bigdecimal'
require_relative '../../lib/subsplash'
require_relative '../print_helper'

require 'dotenv'
Dotenv.load(File.join(__dir__, '..', '..', '.env'))

@client = Subsplash::Client.new(
  access_token: ENV.fetch('ACCESS_TOKEN', nil),
  org_key: ENV.fetch('ORG_KEY', nil)
)
