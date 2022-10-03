class AddPublisherIdtoBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :publisher, foreing_key: true
    change_column :books, :publisher_id, :integer, null: false
  end
end
