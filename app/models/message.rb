class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  def pretty_created_at
  	if (created_at > Time.now.midnight)
  		created_at.strftime("%H:%M %p")
  	else
  		created_at.strftime("%d %b")
  	end
  end
end
