class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :author, comment: "Blog author"
      t.string :title, comment: "Blog title"
      t.string :desc, comment: "Blog description"
      t.timestamps
    end
  end
end
