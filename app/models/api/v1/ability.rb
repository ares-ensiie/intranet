class Api::V1::Ability
  include CanCan::Ability

  def initialize(application)
    can :read, User
    can :read, Promotion
  end
end
