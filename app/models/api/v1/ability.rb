class Api::V1::Ability
  include CanCan::Ability

  def initialize(application)
    can :read, User
    can :search, User
    can :read, Promotion
  end
end
