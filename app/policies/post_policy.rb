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
                scope.where(:published => true)
            end
        end
    end
    
    def index?
        if user.present?
            @posts = policy_scope(Post)
        else
            false
        end
    end
end