class Newsfeed < ApplicationRecord
  # Direct associations

  belongs_to :follower,
             :class_name => "Profile",
             :foreign_key => "user_id",
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
