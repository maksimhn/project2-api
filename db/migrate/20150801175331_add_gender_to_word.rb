class AddGenderToWord < ActiveRecord::Migration
  def change
    add_column :words, :gender, :string, null: false
    add_column :words, :pic, :string
  end
end
