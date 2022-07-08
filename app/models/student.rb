class Student < ApplicationRecord
    belongs_to :instructor
    validates :name, :major, :age, presence: true
end
