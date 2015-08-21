require 'savon'

module Palveluvayla

  class Client
    def initialize(conf = {})
      service_instance = conf[:service_instance]
      service_member_class = conf[:service_member_class]
      service_member_code = conf[:service_member_code]
      service_sub_system_code = conf[:service_sub_system_code]
      service_code = conf[:service_code]
      service_version = conf[:service_version]
      security_server_url = conf[:security_server_url]
      client_instance = conf[:client_instance]
      client_member_class = conf[:client_member_class]
      client_member_code = conf[:client_member_code]
      client_sub_system_code = conf[:client_sub_system_code]
      user_id = conf[:user_id]
      id = conf[:id]

      wsdl_url = "#{security_server_url}/wsdl?instance=#{service_instance}&memberClass=#{service_member_class}&memberCode=#{service_member_code}&subsystemCode=#{service_sub_system_code}&serviceCode=#{service_code}&version=#{service_version}"

      xroad_header = {
        'xrd:service': {
          'id:xRoadInstance': service_instance,
          'id:memberClass': service_member_class,
          'id:memberCode': service_member_code,
          'id:subsystemCode': service_sub_system_code,
          'id:serviceCode': service_code,
          'id:serviceVersion':  service_version
        },
        'xrd:client': {
          'id:xRoadInstance': client_instance,
          'id:memberClass': client_member_class,
          'id:memberCode': client_member_code,
          'id:subsystemCode': client_sub_system_code
        },
        'xrd:userId': user_id,
        'xrd:id': id,
        'xrd:protocolVersion': '4.0',
        attributes!: {
          'xrd:service': {
            'id:objectType': 'SERVICE'
          },
          'xrd:client': {
            'id:objectType': 'SUBSYSTEM'
          }
        }
      }
      @client = Savon::Client.new(wsdl: wsdl_url,
                                  endpoint: security_server_url,
                                  log: true,
                                  log_level: :debug,
                                  namespaces: {
                                    'xmlns:xrd': 'http://x-road.eu/xsd/xroad.xsd',
                                    'xmlns:id': 'http://x-road.eu/xsd/identifiers'
                                  },
                                  soap_header: xroad_header,
                                  ssl_verify_mode: :none)
    end

    private

    def method_missing(method, *args, &block)
      @client.send(method, *args, &block)
    end

  end
end
