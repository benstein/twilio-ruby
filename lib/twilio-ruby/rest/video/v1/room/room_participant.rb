##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        class RoomContext < InstanceContext
          class RoomParticipantList < ListResource
            ##
            # Initialize the RoomParticipantList
            # @param [Version] version Version that contains the resource
            # @param [String] room_sid The room_sid
            # @return [RoomParticipantList] RoomParticipantList
            def initialize(version, room_sid: nil)
              super(version)

              # Path Solution
              @solution = {room_sid: room_sid}
              @uri = "/Rooms/#{@solution[:room_sid]}/Participants"
            end

            ##
            # Lists RoomParticipantInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [room_participant.Status] status The status
            # @param [String] identity The identity
            # @param [Time] date_created_after The date_created_after
            # @param [Time] date_created_before The date_created_before
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
              self.stream(
                  status: status,
                  identity: identity,
                  date_created_after: date_created_after,
                  date_created_before: date_created_before,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams RoomParticipantInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [room_participant.Status] status The status
            # @param [String] identity The identity
            # @param [Time] date_created_after The date_created_after
            # @param [Time] date_created_before The date_created_before
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  status: status,
                  identity: identity,
                  date_created_after: date_created_after,
                  date_created_before: date_created_before,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields RoomParticipantInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size],)

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of RoomParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [room_participant.Status] status The status
            # @param [String] identity The identity
            # @param [Time] date_created_after The date_created_after
            # @param [Time] date_created_before The date_created_before
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of RoomParticipantInstance
            def page(status: :unset, identity: :unset, date_created_after: :unset, date_created_before: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'Status' => status,
                  'Identity' => identity,
                  'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                  'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              RoomParticipantPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of RoomParticipantInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of RoomParticipantInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              RoomParticipantPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Video.V1.RoomParticipantList>'
            end
          end

          class RoomParticipantPage < Page
            ##
            # Initialize the RoomParticipantPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [RoomParticipantPage] RoomParticipantPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of RoomParticipantInstance
            # @param [Hash] payload Payload response from the API
            # @return [RoomParticipantInstance] RoomParticipantInstance
            def get_instance(payload)
              RoomParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Video.V1.RoomParticipantPage>'
            end
          end

          class RoomParticipantContext < InstanceContext
            ##
            # Initialize the RoomParticipantContext
            # @param [Version] version Version that contains the resource
            # @param [String] room_sid The room_sid
            # @param [String] sid The sid
            # @return [RoomParticipantContext] RoomParticipantContext
            def initialize(version, room_sid, sid)
              super(version)

              # Path Solution
              @solution = {room_sid: room_sid, sid: sid,}
              @uri = "/Rooms/#{@solution[:room_sid]}/Participants/#{@solution[:sid]}"

              # Dependents
              @published_tracks = nil
            end

            ##
            # Fetch a RoomParticipantInstance
            # @return [RoomParticipantInstance] Fetched RoomParticipantInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              RoomParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid], sid: @solution[:sid],)
            end

            ##
            # Update the RoomParticipantInstance
            # @param [room_participant.Status] status The status
            # @return [RoomParticipantInstance] Updated RoomParticipantInstance
            def update(status: :unset)
              data = Twilio::Values.of({'Status' => status,})

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              RoomParticipantInstance.new(@version, payload, room_sid: @solution[:room_sid], sid: @solution[:sid],)
            end

            ##
            # Access the published_tracks
            # @return [PublishedTrackList]
            # @return [PublishedTrackContext] if sid was passed.
            def published_tracks(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return PublishedTrackContext.new(@version, @solution[:room_sid], @solution[:sid], sid,)
              end

              unless @published_tracks
                @published_tracks = PublishedTrackList.new(
                    @version,
                    room_sid: @solution[:room_sid],
                    participant_sid: @solution[:sid],
                )
              end

              @published_tracks
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Video.V1.RoomParticipantContext #{context}>"
            end
          end

          class RoomParticipantInstance < InstanceResource
            ##
            # Initialize the RoomParticipantInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] room_sid The room_sid
            # @param [String] sid The sid
            # @return [RoomParticipantInstance] RoomParticipantInstance
            def initialize(version, payload, room_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'room_sid' => payload['room_sid'],
                  'account_sid' => payload['account_sid'],
                  'status' => payload['status'],
                  'identity' => payload['identity'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                  'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                  'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'room_sid' => room_sid, 'sid' => sid || @properties['sid'],}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [RoomParticipantContext] RoomParticipantContext for this RoomParticipantInstance
            def context
              unless @instance_context
                @instance_context = RoomParticipantContext.new(@version, @params['room_sid'], @params['sid'],)
              end
              @instance_context
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The room_sid
            def room_sid
              @properties['room_sid']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [room_participant.Status] The status
            def status
              @properties['status']
            end

            ##
            # @return [String] The identity
            def identity
              @properties['identity']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [Time] The start_time
            def start_time
              @properties['start_time']
            end

            ##
            # @return [Time] The end_time
            def end_time
              @properties['end_time']
            end

            ##
            # @return [String] The duration
            def duration
              @properties['duration']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # Fetch a RoomParticipantInstance
            # @return [RoomParticipantInstance] Fetched RoomParticipantInstance
            def fetch
              context.fetch
            end

            ##
            # Update the RoomParticipantInstance
            # @param [room_participant.Status] status The status
            # @return [RoomParticipantInstance] Updated RoomParticipantInstance
            def update(status: :unset)
              context.update(status: status,)
            end

            ##
            # Access the published_tracks
            # @return [published_tracks] published_tracks
            def published_tracks
              context.published_tracks
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Video.V1.RoomParticipantInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Video.V1.RoomParticipantInstance #{values}>"
            end
          end
        end
      end
    end
  end
end