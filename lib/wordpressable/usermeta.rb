module WordPressable
  module Usermeta
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}usermeta"
      self.primary_key = :umeta_id

      belongs_to :user, foreign_key: "user_id", class_name: WordPressable.configuration.user_class
    end
  end
end
