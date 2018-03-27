module WPDB
  class << self
    def initialize
      @@configuration = Configuration.new
    end

    def configure
      yield(@@configuration)
    end

    def configuration
      @@configuration
    end
  end

  class Configuration
    attr_accessor :prefix, :option_class, :comment_class, :post_class, :postmeta_class, :term_class,
                  :term_relationship_class, :term_taxonomy_class,
                  :user_class, :usermeta_class

    def initialize
      @prefix                  =  "wp_"
      @option_class            =  "WPDB::Option"
      @comment_class           =  "WPDB::Comment"
      @post_class              =  "WPDB::Post"
      @postmeta_class          =  "WPDB::Postmeta"
      @term_class              =  "WPDB::Term"
      @term_relationship_class =  "WPDB::TermRelationship"
      @term_taxonomy_class     =  "WPDB::TermTaxonomy"
      @user_class              =  "WPDB::User"
      @usermeta_class          =  "WPDB::Usermeta"
    end
  end
end

WPDB.initialize
