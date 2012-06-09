class Ability
  include CanCan::Ability

  def initialize(user)
    can :take, Quiz
    can :show, Quiz
    if user
      can :manage, Statistic, :user_id => user.id
      can :manage, PracticeEntry, :user_id => user.id
      can :manage, :all if user.admin?
    end
  end
end
