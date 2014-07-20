class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :question_type
      t.belongs_to :question
      t.json :fields, default: {}

      t.timestamps
    end
  end
end
