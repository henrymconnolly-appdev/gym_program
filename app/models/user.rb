class User < ApplicationRecord
  # Direct associations

  has_one    :newsfeed,
             :dependent => :destroy

  has_one    :profile,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
