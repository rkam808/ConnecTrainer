class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def index?
      user == record.user
    end
  end
end
