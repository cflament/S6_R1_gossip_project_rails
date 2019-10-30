class CreateMessageDeliverings < ActiveRecord::Migration[5.2]
  def change
    create_table :inboxes do |t|
      t.belongs_to :recipient, index: true
      t.belongs_to :recieved_message, index: true
      t.timestamps
    end
  end
end
