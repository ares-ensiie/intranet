class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.is_admin?
  end
end
