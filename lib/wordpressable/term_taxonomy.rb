module WordPressable
  module TermTaxonomy
    extend ActiveSupport::Concern

    included do
      self.table_name = "#{WordPressable.configuration.prefix}term_taxonomy"
      self.primary_key = :term_taxonomy_id

      belongs_to :term, foreign_key: "term_id", class_name: WordPressable.configuration.term_class
      belongs_to :parent, foreign_key: "parent", class_name: WordPressable.configuration.term_class
      has_many :term_relationships, foreign_key: "term_taxonomy_id", class_name: WordPressable.configuration.term_relationship_class

      has_many :posts, through: :term_relationships, class_name: WordPressable.configuration.post_class
    end
  end
end
