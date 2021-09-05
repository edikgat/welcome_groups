# frozen_string_literal: true

class GroupPolicy < ApplicationPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
    super
  end

  def update?
    group.owner == user
  end

  def destroy?
    update?
  end

  def index?
    true
  end

  def create?
    true
  end

  def show?
    true
  end
end
