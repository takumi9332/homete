class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :image

  has_many :posts
  has_many :praises, dependent: :destroy

  validates :name, presence: true, length: { maximum: 6 }
  validates :self_introduction, length: { maximum: 200 }
end
