class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy
    
    validates :name, length: { minimum: 5 }, presence: true
    validates :description, presence: true
    
    scope :visible_to, ->(user) { user ? all : publicly_viewable }
    
    scope :publicly_viewable, -> { where(public: true) }
    
    scope :privately_viewable, -> { where(public: false) }
    
    #also tried defining class methods, with the same error result
    # def self.publicly_viewable
    #     where(public: true)
    # end
    
    # def self.privately_viewable
    #     where(public: false)
    # end
end
