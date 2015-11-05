class Question < ActiveRecord::Base
    # def resolved=(value)
    #     if value == 0
    #         self.actual_literal_column_set(:resolved, false)
    #     else
    #         self.actual_literal_column_set(:resolved, true)
    #     end
    # end
end

# Question.create(title: 'asdf', body: 'this', resolved: 0)
