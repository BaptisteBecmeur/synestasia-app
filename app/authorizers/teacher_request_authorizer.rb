class TeacherRequestAuthorizer < ApplicationAuthorizer
  
  def self.creatable_by?(user)
    (user.present? and !user.has_any_role?(:admin, :teacher) and !user.last_teacher_request.try(:validating?))
  end
  def self.updatable_by?(user)
    (user.present? and user.has_any_role?(:admin))
  end
  def self.deletable_by?(user)
    (user.present? and !user.has_any_role?(:teacher))
  end
  def self.readable_by?(user)
    (user.present? and user.has_any_role?(:admin))
  end
  def self.manageable_request_by(user)
    (user.present? and user.has_any_role?(:admin))
  end

end
