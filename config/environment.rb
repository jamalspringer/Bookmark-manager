require 'capybara'
require 'capybara/rspec'
require 'sinatra'
require 'require_all'
require_relative '../spec/spec_helper'
require 'pg'

require_all 'app'

ENV['SINATRA_ENV'] ||= "development"
ENV['RACK_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

