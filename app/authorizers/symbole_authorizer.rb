class SymboleAuthorizer < ApplicationAuthorizer
  
  def self.creatable_by?(user)
    (user.present? and user.has_any_role?(:admin, :teacher))
  end
  def self.updatable_by?(user)
    (user.present? and user.has_any_role?(:admin, :teacher))
  end
  def self.deletable_by?(user)
    (user.present? and user.has_any_role?(:admin, :teacher))
  end
  def self.readable_by?(user)
    user.present?
  end

end
