class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      create?
    end

    def create?
      true
    end

    def update?
      user == record.user
    end
  end
end
