class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  validates_presence_of :correct
end
