##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class TranscriptionList < ListResource
      ##
      # Initialize the TranscriptionList
      def initialize(version, account_sid: nil)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Transcriptions.json"
      end
      
      ##
      # Reads TranscriptionInstance records from the API as a list.
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
      # Retrieve a single page of TranscriptionInstance records from the API.
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
        return TranscriptionPage.new(
            @version,
            response,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Constructs a TranscriptionContext
      def get(sid)
        TranscriptionContext.new(
            @version,
            account_sid: @solution[:account_sid],
            sid: sid,
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '#<Twilio.Api.V2010.TranscriptionList>'
      end
    end
  
    class TranscriptionPage < Page
      def initialize(version, response, account_sid)
        super(version, response)
        
        # Path Solution
        @solution = {
            'account_sid' => account_sid,
        }
      end
      
      def get_instance(payload)
        return TranscriptionInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
        )
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        '<Twilio.Api.V2010.TranscriptionPage>'
      end
    end
  
    class TranscriptionContext < InstanceContext
      def initialize(version, account_sid, sid)
        super(version)
        
        # Path Solution
        @solution = {
            account_sid: account_sid,
            sid: sid,
        }
        @uri = "/Accounts/#{@solution[:account_sid]}/Transcriptions/#{@solution[:sid]}.json"
      end
      
      ##
      # Fetch a TranscriptionInstance
      def fetch
        params = {}
        
        @version.fetch(
            'GET',
            @uri,
            params,
        )
        
        return TranscriptionInstance.new(
            @version,
            payload,
            account_sid: @solution['account_sid'],
            sid: @solution['sid'],
        )
      end
      
      ##
      # Deletes the TranscriptionInstance
      def delete
        return @version.delete('delete', @uri)
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
        "#<Twilio.Api.V2010.TranscriptionContext #{context}>"
      end
    end
  
    class TranscriptionInstance < InstanceResource
      def initialize(version, payload, account_sid, sid: nil)
        super(version)
        
        # Marshaled Properties
        @properties = {
            'account_sid' => payload['account_sid'],
            'api_version' => payload['api_version'],
            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
            'duration' => payload['duration'],
            'price' => payload['price'].to_f,
            'price_unit' => payload['price_unit'],
            'recording_sid' => payload['recording_sid'],
            'sid' => payload['sid'],
            'status' => payload['status'],
            'transcription_text' => payload['transcription_text'],
            'type' => payload['type'],
            'uri' => payload['uri'],
        }
        
        # Context
        @instance_context = nil
        @params = {
            'account_sid' => account_sid,
            'sid' => sid || @properties['sid'],
        }
      end
      
      def context
        unless @instance_context
          @instance_context = TranscriptionContext.new(
              @version,
              @params['account_sid'],
              @params['sid'],
          )
        end
        @instance_context
      end
      
      def account_sid
        @properties['account_sid']
      end
      
      def api_version
        @properties['api_version']
      end
      
      def date_created
        @properties['date_created']
      end
      
      def date_updated
        @properties['date_updated']
      end
      
      def duration
        @properties['duration']
      end
      
      def price
        @properties['price']
      end
      
      def price_unit
        @properties['price_unit']
      end
      
      def recording_sid
        @properties['recording_sid']
      end
      
      def sid
        @properties['sid']
      end
      
      def status
        @properties['status']
      end
      
      def transcription_text
        @properties['transcription_text']
      end
      
      def type
        @properties['type']
      end
      
      def uri
        @properties['uri']
      end
      
      ##
      # Fetch a TranscriptionInstance
      def fetch
        @context.fetch()
      end
      
      ##
      # Deletes the TranscriptionInstance
      def delete
        @context.delete()
      end
      
      ##
      # Provide a user friendly representation
      def to_s
        context = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
        "<Twilio.Api.V2010.TranscriptionInstance #{context}>"
      end
    end
  end
end