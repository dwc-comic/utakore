class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :carts, dependent: :destroy
  # acts_as_paranoid

  #  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :name, :status, :deleted_at, :email, :password, :password_confirmation, :remember_me
  # before_create :reset_param
 # def reset_param
 #  self.status = "active"
 # end
end
