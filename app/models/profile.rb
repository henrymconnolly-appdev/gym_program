class Profile < ApplicationRecord
  # Direct associations

  has_many   :newsfeeds,
             :foreign_key => "user_id",
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
