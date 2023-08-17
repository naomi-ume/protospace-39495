class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email , presence: true , uniqueness: true,format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
         validates :password, presence: true, length: { minimum: 6 }
         validates :password_confirmation, presence: true
         validate  :password_confirmation_match
         validates :encrypted_password, presence: true
         validates :name , presence: true
         validates :profile , presence: true
         validates :occupation , presence: true
         validates :position , presence: true

         has_many :prototypes
         has_many :comments

private

  def password_confirmation_match
    errors.add(:password_confirmation, "doesn't match Password") if password != password_confirmation
  end
end