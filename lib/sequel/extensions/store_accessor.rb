module Sequel
  module Extensions
    module StoreAccessor
      def store_accessor(field, *accessors)
        accessors.each do |accessor|
          define_method accessor do
            self[field]&.send(:[], accessor.to_s)
          end

          define_method "#{accessor}=" do |value|
            send "#{field}=", (self[field] || {}).merge({ accessor.to_s => value })
          end
        end
      end
    end
  end
end

Sequel::Model.extend Sequel::Extensions::StoreAccessor
