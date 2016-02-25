class Ability
  include CanCan::Ability

  def initialize(user)
    operations(user)
    shouts(user)
    users(user)
  end

  def operations(user)
    can :read, Operations::Operation, hidden: 0

    if user
      can :create, Operations::Operation if user.has_role?(:operations)
      can :manage, Operations::Operation, author_id: user.id
      can :manage, Operations::Operation if user.superadmin?
    end
  end

  def shouts(user)
    can :read, Shout

    if user
      can :create, Shout
      can :manage, Shout, user_id: user.id.to_s
      can :manage, Shout if user.admin?
    end
  end

  def users(user)
    can :read, User
  end
end
