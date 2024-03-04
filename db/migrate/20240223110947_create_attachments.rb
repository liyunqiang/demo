class CreateAttachments < ActiveRecord::Migration[7.1]
  def change
    create_table :attachments do |t|
      t.integer :attachable_id, comment: "Polymorphic Object ID"
      t.string :attachable_type, comment: "Polymorphic Object Type"
      t.string :file_path, comment: "File Path"
      t.timestamps
    end

    add_index :attachments, [:attachable_id, :attachable_type]
  end
end
