require 'minitest_helper'

class ClientTest < Minitest::Test

  def test_get_response
    configuration = {
      service_instance: 'FI-DEV',
      service_member_class: 'GOV',
      service_member_code: '0245437-2',
      service_sub_system_code: 'TestService',
      service_code: 'getRandom',
      service_version: 'v1',
      security_server_url: 'https://1.2.3.4',
      client_instance: 'FI-DEV',
      client_member_class: 'COM',
      client_member_code: '123456-7',
      client_sub_system_code: 'TestSystem',
      user_id: 'test',
      id: 'ID11234'
    }

    wsdl_url = "#{configuration[:security_server_url]}/wsdl?instance=#{configuration[:service_instance]}&memberClass=#{configuration[:service_member_class]}&memberCode=#{configuration[:service_member_code]}&subsystemCode=#{configuration[:service_sub_system_code]}&serviceCode=#{configuration[:service_code]}&version=#{configuration[:service_version]}"

    client = Palveluvayla::Client.new(configuration)

    stub_request(:get, wsdl_url).to_return(fixture('wsdl.xml'))
    stub_request(:post, configuration[:security_server_url]).to_return(fixture('response.xml'))

    response = client.call(:get_random)
    assert_equal response.body[:get_random_response][:response], {data: '15'}
  end

end
