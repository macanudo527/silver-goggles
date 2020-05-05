class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  validates_inclusion_of :correct, in: [true, false]
end
