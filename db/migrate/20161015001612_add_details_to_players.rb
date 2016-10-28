class AddDetailsToPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :element, :string
  	add_column :players, :star, :integer
  end
end
