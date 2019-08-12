require 'capybara'
require 'capybara/rspec'
require 'sinatra'
require 'spec_helper'
require 'require_all'

require_all 'app'

ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

