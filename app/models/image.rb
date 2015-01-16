# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  created_at         :datetime
#  updated_at         :datetime
#  imageable_id       :integer
#  imageable_type     :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image,
    :storage => :google_drive,
    :google_drive_credentials => "#{Rails.root}/config/google_drive.yml",
    :styles => { big: 'x1024>', medium: 'x300>', thumb: 'x150>'},
    :google_drive_options => {
      :public_folder_id => "0Bzc17J5i-YOUfjhiaXF2WG5MNTBaUklLemtDa3hTMS1pMUwwX2lZdzRFVk5aNzhpUVRjaVE",
      :path => proc { |style| "#{style}_#{id}_#{image.original_filename}" }
    }
 #   has_attached_file :image,
 # 	:storage => :dropbox,
 # 	:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
 # 	:styles => { big: 'x1024>', medium: 'x300>', thumb: 'x150>'},    
	# :dropbox_options => {       
	# :path => proc { |style| "#{style}/#{id}_#{image.original_filename}"},      
	# :unique_filename => true   
 #  	},
 #  :dropbox_visibility => 'public'
	#:unique_filename => true   
  # has_attached_file :image, styles: { big: 'x1024>',
  #                                     medium: 'x300>',
  #                                     thumb: 'x150>' },
  #                           default_url: '/images/:style/missing.png'

  validates_attachment :image, presence: true, size: { in: 0..10.megabytes }
  validates_attachment_content_type :image, content_type: /image/
end
