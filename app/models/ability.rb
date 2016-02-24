class Ability
  include CanCan::Ability

  def initialize(user)
    operations(user)
    shouts(user)
    users(user)
  end

  def operations(user)
    can :read, Operation, hidden: 0

    if user
      can :create, Operation if user.has_role?(:operations)
      can :manage, Operation, author_id: user.id
      can :manage, Operation if user.superadmin?
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
