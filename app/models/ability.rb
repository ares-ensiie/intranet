class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.is_admin?
    can [:read,:new,:create], :all
    can [:update,:destroy], Gallery::Album do |album|
      user.id.eql? album.author.id 
    end 
    can [:update,:destroy], Gallery::Photo do |photo|
      user.id.eql? photo.album.author.id 
    end
  end
end
