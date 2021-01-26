class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :posts
  has_many :praises, dependent: :destroy
  has_many :likes
  has_many :followings, through: :likes, source: :follow
  has_many :reverse_of_likes, class_name: 'Like', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_likes, source: :user

  validates :name, presence: true, length: { maximum: 6 }
  validates :self_introduction, length: { maximum: 200 }


  def follow(other_user)
    unless self == other_user
      self.likes.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    like = self.likes.find_by(follow_id: other_user.id)
    like.destroy if like
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end
end
