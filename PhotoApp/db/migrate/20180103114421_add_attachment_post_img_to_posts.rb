class AddAttachmentPostImgToPosts < ActiveRecord::Migration[4.2]
  def self.up
    change_table :posts do |t|
      t.attachment :post_img
    end
  end

  def self.down
    remove_attachment :posts, :post_img
  end
end
