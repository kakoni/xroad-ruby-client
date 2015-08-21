$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'palveluvayla'

require 'byebug'
require 'minitest/autorun'
require 'webmock/minitest'
include WebMock::API
#WebMock.allow_net_connect!


def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(File.join(fixture_path, file))
end
