class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table(:teams) do |t|
      t.column(:name, :string)
      t.timestamps()
    end
    create_table(:home_teams) do |t|
      t.column(:team_id, :integer)
      t.column(:game_id, :integer)
      t.timestamps()
    end
    create_table(:away_teams) do |t|
      t.column(:team_id, :integer)
      t.column(:game_id, :integer)
      t.timestamps()
    end
    create_table(:games) do |t|
      t.column(:h_score, :integer)
      t.column(:a_score, :integer)
      t.timestamps()
    end
  end
end
