module WordPressable
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
      @option_class            =  ""
      @comment_class           =  ""
      @post_class              =  ""
      @postmeta_class          =  ""
      @term_class              =  ""
      @term_relationship_class =  ""
      @term_taxonomy_class     =  ""
      @user_class              =  ""
      @usermeta_class          =  ""
    end
  end
end

WordPressable.initialize
