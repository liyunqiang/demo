class ChangeAttachmentsFilePathToImage < ActiveRecord::Migration[7.1]
  def change
    rename_column :attachments, :file_path, :image
  end
end
