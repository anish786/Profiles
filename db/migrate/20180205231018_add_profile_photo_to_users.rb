class AddProfilePhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profilephoto_filename, :string
  end
end
