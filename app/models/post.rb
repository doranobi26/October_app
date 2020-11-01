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

  def Post.search(search, user_or_post)
    if user_or_post == "2"
      if search == ""
        Post.where(['title LIKE ?',"#{search}" ])
      else
        Post.where(['title LIKE ?', "%#{search}%"])
      end
    end
  end

  
end
