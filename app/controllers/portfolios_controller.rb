class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
    
    def index
        @portfolio_items = Portfolio.all
    end
    
    def new
        @portfolio_item = Portfolio.new
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
      
  end


private
    def portfolio_params
        params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end

    def set_portfolio
       @portfolio_item = Portfolio.find(params[:id]) 
    end
end