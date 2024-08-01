class AddLineNotificationToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :line_notification, :boolean, null: false, default: true
  end
end
