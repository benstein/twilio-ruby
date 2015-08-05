module Twilio
  module Resources
    module V2010
      class AccountInstance
        class AvailablePhoneNumberCountryInstance
          class MobileList < ListResource
            can :list
            command_alias :mobile
            
            def initialize(client, inheritance={})
              super
              path "/Accounts/#{@account_sid}/AvailablePhoneNumbers/Mobile.json"
              instance_id_key 'sid'
              instance_class MobileInstance
              list_key 'available_phone_numbers'
            end
          end
        
          class MobileInstance < InstanceResource
            def initialize(client, inheritance={}, params={})
              super
              instance_id_key 'sid'
            end
          end
        end
      end
    end
  end
end