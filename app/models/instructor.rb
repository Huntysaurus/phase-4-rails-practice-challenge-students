class Instructor < ApplicationRecord
    has_many :students
    validates :name, :major, :age, presence: true
end
