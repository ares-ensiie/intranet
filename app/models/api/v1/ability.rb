class Api::V1::Ability
  include CanCan::Ability

  def initialize(application)
    can :read, User
    can :search, User
    can :read, Promotion
    can :read, Courses::Matter
    can :read, Courses::Document
  end
end
