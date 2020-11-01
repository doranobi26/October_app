class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, length: { maximum: 10 }
  validates :name, length: { minimum: 2 }
  validates :name, presence: true
  validates :introduction, length: { maximum: 30 }
  attachment :profile_image

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  #「follower」モデルのUserを集め「followings」と定義。
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  #「following」モデルのUserを集め「followers」と定義。
  has_many :followers, through: :passive_relationships, source: :following

  accepts_attachments_for :pictures, attachment: :picture



  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def User.search(search, user_or_post)
    if user_or_post == "1"
      if search == ""
        User.where(['name LIKE ?', "#{search}"])
      else
        User.where(['name LIKE ?', "%#{search}%"])
      end
    end
  end

  
end
