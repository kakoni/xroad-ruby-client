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

      wsdl_url = "#{conf[:security_server_url]}/wsdl"\
                 "?instance=#{conf[:service_instance]}"\
                 "&memberClass=#{conf[:service_member_class]}"\
                 "&memberCode=#{conf[:service_member_code]}"\
                 "&subsystemCode=#{conf[:service_sub_system_code]}"\
                 "&serviceCode=#{conf[:service_code]}"\
                 "&version=#{conf[:service_version]}"

      xroad_header = {
        'xrd:service': {
          'id:xRoadInstance': conf[:service_instance],
          'id:memberClass': conf[:service_member_class],
          'id:memberCode': conf[:service_member_code],
          'id:subsystemCode': conf[:service_sub_system_code],
          'id:serviceCode': conf[:service_code],
          'id:serviceVersion':  conf[:service_version]
        },
        'xrd:client': {
          'id:xRoadInstance': conf[:client_instance],
          'id:memberClass': conf[:client_member_class],
          'id:memberCode': conf[:client_member_code],
          'id:subsystemCode': conf[:client_sub_system_code]
        },
        'xrd:userId': conf[:user_id],
        'xrd:id': conf[:id],
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
