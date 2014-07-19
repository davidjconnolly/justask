class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :type
      t.belongs_to :page
      t.integer :ordinal
      t.text :text
      t.json :fields, default: {}

      t.timestamps
    end
  end
end
