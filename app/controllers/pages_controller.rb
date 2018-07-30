class PagesController < ApplicationController
  def home
      @posts = Blog.all
      @skills = Skill.all
      @page_title = "Rubyx developpement | Portfolio Enzo Clavelloux"
  end

  def about
    @page_title = "A propos"

  end

  def contact
    @page_title = "Contact"
  end
end
