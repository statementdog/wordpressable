module WordPressable
  module Post
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}posts"
      self.primary_key = :ID

      belongs_to :author, class_name: WordPressable.configuration.user_class, foreign_key: "post_author"
      belongs_to :parent, class_name: WordPressable.configuration.post_class

      has_many :comments, foreign_key: "comment_post_ID", class_name: WordPressable.configuration.comment_class
      
      # tag / category
      has_many :term_relationships, foreign_key: "object_id", class_name: WordPressable.configuration.term_relationship_class
      has_many :terms, through: :term_relationships, foreign_key: "term_id", class_name: WordPressable.configuration.term_class
      has_many :tags, -> { where("#{WordPressable.configuration.term_taxonomy_class.constantize.table_name}.taxonomy = 'post_tag'") }, through: :terms, source: :term_taxonomy, class_name: WordPressable.configuration.term_class
      has_many :categories, -> { where("#{WordPressable.configuration.term_taxonomy_class.constantize.table_name}.taxonomy = 'category'") }, through: :terms, source: :term_taxonomy, class_name: WordPressable.configuration.term_class

      has_many :attachments, -> { where(post_type: "attachment") }, foreign_key: "post_parent", class_name: WordPressable.configuration.post_class
      has_many :revisions, -> { where(post_type: "revision") }, foreign_key: "post_parent", class_name: WordPressable.configuration.post_class
      has_many :postmetas, foreign_key: "post_id", class_name: WordPressable.configuration.postmeta_class
    end
  end
end
