class CreateTitleFigures < ActiveRecord::Migration[4.2]
  def change
    create_table :titlefigures do |t|
      t.integer :title_id
      t.integer :figure_id
    end
  end
end
