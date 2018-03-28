module WordPressable
  module Postmeta
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}postmeta"
      self.primary_key = :meta_id

      belongs_to :post, foreign_key: "post_id", class_name: WordPressable.configuration.post_class
    end
  end
end
