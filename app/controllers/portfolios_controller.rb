class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
    layout "portfolio"
    access all: [:show, :index], user: {except: [:destroy, :new, :update, :edit]}, site_admin: :all
    
    def index
        @portfolio_items = Portfolio.by_position
        @page_title = "RubyX Projects"
    end

    def sort
      params[:order].each do |key, value|
        Portfolio.find(value[:id]).update(position: value[:position])
      end

      render body: nil
    end
    
    def php
       @portfolio_items = Portfolio.php     
    end 
    
    def ruby
       @portfolio_items = Portfolio.ruby   
    end
    
    def new
        @portfolio_item = Portfolio.new
    end
    
    def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        flash[:success] = "Votre portfolio a été créer"
        format.html { redirect_to portfolios_path }
      else
        flash[:danger] = "Remplir les champs manquants"
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
        flash[:success] = "Le Portfolio as bien été mis à jour"
        format.html { redirect_to portfolios_path }
      else
        flash[:danger] = "Remplir les champs manquants"
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
          flash[:danger] = "Le portfolio item a été supprimer"
          format.html {redirect_to portfolios_url}
      end
  end


private
    def portfolio_params
        params.require(:portfolio).permit(:title, 
                                          :subtitle, 
                                          :body, 
                                          :main_image, 
                                          :thumb_image, 
                                          technologies_attributes: [:id, :name, :_destroy]
                                         )
    end

    def set_portfolio
       @portfolio_item = Portfolio.find(params[:id]) 
    end
end
