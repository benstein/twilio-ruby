##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class ThisMonthList < ListResource
      ##
      # Initialize the ThisMonthList
      def initialize(version, account_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Records/ThisMonth"
      end
      
      ##
      # Reads ThisMonthInstance records from the API as a list.
      def list(limit: nil, page_size: nil)
        self.stream(
            limit: limit,
            page_size: page_size
        ).entries
      end
      
      def stream(limit: nil, page_size: nil)
        limits = @version.read_limits(limit, page_size)
        
        page = self.page(
            page_size: limits['page_size'],
        )
        
        @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
      end
      
      def each
        limits = @version.read_limits
        
        page = self.page(
            page_size: limits['page_size'],
        )
        
        @version.stream(page,
                        limit: limits['limit'],
                        page_limit: limits['page_limit']).each {|x| yield x}
      end
      
      ##
      # Retrieve a single page of ThisMonthInstance records from the API.
      def page(page_token: nil, page_number: nil, page_size: nil)
        params = {
            'PageToken' => page_token,
            'Page' => page_number,
            'PageSize' => page_size,
        }
        response = @version.page(
            'GET',
            @uri,
            params
        )
        return ThisMonthPage.new(
            @version,
            response,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.ThisMonthList>'
      end
    end
  
    class ThisMonthPage < Page
      def initialize(version, response, account_sid)
        super(version, response)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
        }
      end
      
      def get_instance(payload)
        return ThisMonthInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Api.V2010.ThisMonthPage>'
      end
    end
  
    class ThisMonthInstance < InstanceResource
      def initialize(version, payload)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'api_version' => payload['api_version'],
            'category' => payload['category'],
            'count' => payload['count'],
            'count_unit' => payload['count_unit'],
            'description' => payload['description'],
            'end_date' => Twilio.deserialize_rfc2822(payload['end_date']),
            'price' => payload['price'].to_f,
            'price_unit' => payload['price_unit'],
            'start_date' => Twilio.deserialize_rfc2822(payload['start_date']),
            'subresource_uris' => payload['subresource_uris'],
            'uri' => payload['uri'],
            'usage' => payload['usage'],
            'usage_unit' => payload['usage_unit'],
        }
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def api_version
        @properties['api_version']
      end
      
      def category
        @properties['category']
      end
      
      def count
        @properties['count']
      end
      
      def count_unit
        @properties['count_unit']
      end
      
      def description
        @properties['description']
      end
      
      def end_date
        @properties['end_date']
      end
      
      def price
        @properties['price']
      end
      
      def price_unit
        @properties['price_unit']
      end
      
      def start_date
        @properties['start_date']
      end
      
      def subresource_uris
        @properties['subresource_uris']
      end
      
      def uri
        @properties['uri']
      end
      
      def usage
        @properties['usage']
      end
      
      def usage_unit
        @properties['usage_unit']
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        "<Twilio.Api.V2010.ThisMonthInstance>"
      end
    end
  end
end