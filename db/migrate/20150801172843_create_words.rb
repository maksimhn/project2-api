class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.text :word, index: { unique: true }
    end
  end
end
