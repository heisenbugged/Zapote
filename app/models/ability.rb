class Ability
  include CanCan::Ability

  def initialize(user)
    can :take, Quiz
    can :show, Quiz
    if user
      can :manage, :all if user.admin?
    end
  end
end
