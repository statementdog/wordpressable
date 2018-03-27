module WPDB
  module Option
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WPDB.configuration.prefix}options"
      self.primary_key = :option_id
    end
  end
end
