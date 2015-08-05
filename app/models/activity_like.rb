class ActivityLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates :user_id, uniqueness: {scope: :activity_id}
end
