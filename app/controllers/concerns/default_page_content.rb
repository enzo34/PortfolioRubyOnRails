module DefaultPageContent
    extend ActiveSupport::Concern
    
    included do
        before_action :set_page_defaults
    end
    
    def set_page_defaults
        @page_title = " Rubyx developpement | Portfolio Enzo Clavelloux"
        @seo_keywords = "Enzo Clavelloux rubyx developpement dev"
    end
end