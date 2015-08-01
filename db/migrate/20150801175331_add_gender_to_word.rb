class AddGenderToWord < ActiveRecord::Migration
  def change
    add_column :words, :gender, :string, null: false
  end
end
