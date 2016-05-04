module ApplicationHelper
	def current_user_conversations
  	current_user.conversations.includes(:messages).order("messages.created_at DESC")
  end
end
