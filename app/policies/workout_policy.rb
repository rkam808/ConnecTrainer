class WorkoutPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

      def show?
        true
      end

      def create?
        true
      end

      def update?
      user == record.user
      # - record: the restaurant passed to the `authorize` method in controller
      # - user:   the `current_user` signed in with Devise.
      end

      def destroy?
        user == record.user
      end


  end
end
