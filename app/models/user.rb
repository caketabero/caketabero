class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cakes

  validates :name, presence: true, length: { minimum: 1, maximum: 255 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }
  validates :telephone_number, presence: true, length: { minimum: 9, maximum: 11 }
  # validates :encrypted_password, presence: true, length: { minimum: 8, maximum:255 }
  # validates :admin_flag, presence: true
  # validates :deleted_flag, presence: true
  
  def change
    add_column :users, deleted_flag, :boolean, default: false
  end
end
