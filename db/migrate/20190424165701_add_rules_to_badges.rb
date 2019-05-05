class AddRulesToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :rule_name, :string
    add_column :badges, :rule_value, :string
  end
end
