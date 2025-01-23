class AddUserRefToTasks < ActiveRecord::Migration[6.1]
  def change
    # Add the column first, allowing null values initially
    add_reference :tasks, :user, null: true, foreign_key: true

    # Set a default user_id for existing records
    Task.update_all(user_id: User.first.id) if User.exists?

    # Change the column to enforce NOT NULL constraint
    change_column_null :tasks, :user_id, false
  end
end
