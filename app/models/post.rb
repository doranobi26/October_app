class Post < ApplicationRecord

  belongs_to :user
  belongs_to :category
  belongs_to :member
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :nices, dependent: :destroy

  accepts_attachments_for :pictures, attachment: :picture

  def niced_by?(user)
    nices.where(user_id: user.id).exists?
  end
end
