class Publisher < ApplicationRecord

  belongs_to :user

  has_many :attachments, as: :attachable

  accepts_nested_attributes_for :attachments
end
