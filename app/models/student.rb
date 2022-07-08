class Student < ApplicationRecord
    belongs_to :instructor
    validates :name, :major, :age, presence: true
    # validates :age, numericality:, greater_than: 18 doesn't work properly. Only deliverable I need left to pass it all
end
