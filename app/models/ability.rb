class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :take, Quiz
      can :manage, :all if user.admin?
    end
  end
end
