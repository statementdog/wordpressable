module WordPressable
  module Comment
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}comments"
      self.primary_key =  :comment_ID

      belongs_to :post, foreign_key: "comment_post_ID", class_name: WordPressable.configuration.post_class
      belongs_to :user, foreign_key: "user_id", class_name: WordPressable.configuration.user_class
    end
  end
end
