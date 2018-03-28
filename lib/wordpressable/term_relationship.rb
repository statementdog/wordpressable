module WordPressable
  module TermRelationship
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}term_relationships"
      self.primary_key =  :object_id

      belongs_to :term_taxonomy, foreign_key: "term_taxonomy_id", class_name: WordPressable.configuration.term_taxonomy_class
      has_one :term, :through => :term_taxonomy, class_name: WordPressable.configuration.term_class

      belongs_to :post, foreign_key: "object_id", class_name: WordPressable.configuration.post_class
      has_many :postmetas, foreign_key: "post_id", primary_key: "object_id", class_name: WordPressable.configuration.postmeta_class
    end
  end
end
