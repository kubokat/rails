class AddUserToTest < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tests, :user, foreign_key: true)
    remove_index(:tests_users, :name => 'index_tests_users_on_user_id_and_test_id')
  end
end
