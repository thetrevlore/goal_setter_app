class Comment < ActiveRecord::Base

  belongs_to :goal,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :Goal

  belongs_to :authour,
    primary_key: :id,
    foreign_key: :authour_id,
    class_name: :User

end
