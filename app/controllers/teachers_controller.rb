class TeachersController < ApplicationController
  def index
  	#redirect_to root_path unless (current_user.present? and !current_user.has_role? :teacher)
  	redirect_to root_path unless current_user.present?
  	@teachers = User.with_role(:teacher)
  end
end
