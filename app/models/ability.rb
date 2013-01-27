class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.is_admin?
    can [:read,:new,:create], :all
    can [:update,:destroy], Courses::Document do |document|
      user.id.eql? document.author.id 
    end 
  end
end
