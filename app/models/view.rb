class View < ActiveRecord::Base

  belongs_to :goal,
    primary_key: :id,
    foreign_key: :goal_id,
    class_name: :Goal

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

end
