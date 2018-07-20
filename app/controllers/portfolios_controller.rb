class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
    layout "portfolio"
    access all: [:show, :index], user: {except: [:destroy, :new, :update, :edit]}, site_admin: :all
    
    def index
        @portfolio_items = Portfolio.all
        @page_title = "Mon Portfolio"
    end
    
    def php
       @portfolio_items = Portfolio.php     
    end 
    
    def ruby
       @portfolio_items = Portfolio.ruby   
    end
    
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build }
    end
    
    def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Votre Portfolio a été créer' }
      else
        format.html { render :new }
      end
    end
  end

   def edit
      set_portfolio
   end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Le Portfolio Item a été mis à jour' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
      @page_title = @portfolio_item.title
      @seo_keywords = @portfolio_item.body
  end

 def destroy
      @portfolio_item.destroy
      respond_to do |format|
          format.html { redirect_to portfolios_url, notice: 'Le portfolio item a été supprimer'}
      end
  end


private
    def portfolio_params
        params.require(:portfolio).permit(:title, 
                                          :subtitle, 
                                          :body, 
                                          :main_image, 
                                          :thumb_image, 
                                          technologies_attributes: [:name]
                                         )
    end

    def set_portfolio
       @portfolio_item = Portfolio.find(params[:id]) 
    end
end
