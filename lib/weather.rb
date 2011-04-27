require "rubygems"
require "httparty"
require "nokogiri"
require 'net/http'
require 'uri'

require File.dirname(__FILE__) + "/weather_data.rb"
require File.dirname(__FILE__) + "/google.rb"
require File.dirname(__FILE__) + "/parser.rb"
require File.dirname(__FILE__) + "/weather_html_helper.rb"