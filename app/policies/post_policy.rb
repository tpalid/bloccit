class PostPolicy < ApplicationPolicy

    class Scope < Scope
    attr_reader :user, :scope
    
        def initialize(user, scope)
            @user = user
            @scope = scope
        end

        def resolve
            if user.admin? || user.moderator?
                scope.all
            else
                false
            end
        end
    end
end