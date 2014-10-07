class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read,:new,:create], :all
    can [:update,:destroy], Courses::Document do |document|
      user.id.eql? document.author.id
    end
    can [:update,:destroy], Gallery::Album do |album|
      user.id.eql? album.author.id
    end
    can [:update,:destroy], Gallery::Photo do |photo|
      user.id.eql? photo.album.author.id
    end
    can [:read, :update, :destroy], Oauth::Application do |app|
      app.owner.eql? current_user
    end
  end
end
