class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :survey
      t.integer :ordinal
      t.string :title
      t.text :description
      t.text :text

      t.timestamps
    end
  end
end
