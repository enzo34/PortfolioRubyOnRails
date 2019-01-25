class AddLinkToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :link, :string
  end
end
