class AddAttachmentAptImgToApts < ActiveRecord::Migration
  def self.up
    change_table :apts do |t|
      t.attachment :apt_img
    end
  end

  def self.down
    remove_attachment :apts, :apt_img
  end
end
