module WordPressable
  module User
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}users"
      self.primary_key = :ID

      has_many :posts, foreign_key: "post_author", class_name: WordPressable.configuration.post_class
      has_many :comments, foreign_key: "user_id", class_name: WordPressable.configuration.comment_class
      has_many :usermetas, foreign_key: "user_id", class_name: WordPressable.configuration.usermeta_class
    end
  end
end
