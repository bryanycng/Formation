class AddPlayerToTeams < ActiveRecord::Migration[5.0]
  def change
    add_reference :teams, :player, foreign_key: true
  end
end
