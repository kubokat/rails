class Fixes < ActiveRecord::Migration[5.2]
  def change
    change_column(:answers, :correct, :boolean)
    change_column_default(:answers, :correct, false)
  end
end
