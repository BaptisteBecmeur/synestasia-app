module ApplicationHelper

	def current_user_conversations
  	Conversation.involving(current_user).includes(:messages).order("messages.created_at DESC")
  end

end
