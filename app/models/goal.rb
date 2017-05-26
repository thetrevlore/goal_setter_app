class Goal < ActiveRecord::Base

  belongs_to :user,
    primary_key: :id,
    class_name: :User,
    foreign_key: :user_id

  has_many :views,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :View

  has_many :comments,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :Comment

end
