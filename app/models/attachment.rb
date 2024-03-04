class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  mount_uploader :image, AvatarUploader

end
