class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user && user.is_admin?
      can :manage, :all
      can :access, :rails_admin
      can :dashboard
    end
  end
end
