class TeacherRequest < ActiveRecord::Base
	include Authority::Abilities
	belongs_to :user

	after_commit :change_user_role, :if => :persisted?

	def validating?
		status == "validating"
	end

	def change_user_role
		case status
		when "refused"
			user.remove_role :teacher
		when "validated"
			user.add_role :teacher
		when "canceled"
			user.remove_role :teacher
		when "validating"
			user.remove_role :teacher
		else
		end
	end
end
