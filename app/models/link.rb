class Link < ApplicationRecord
	belongs_to :source
  	has_many :clicks
  	has_many :users, through: :clicks
  	has_and_belongs_to_many :entries
  	has_many :study_sets
  	has_many :study_records, through: :study_sets

  	validates_presence_of :title
  	validates :url, url: { schemes: ['https', 'http'] }

  	scope :ordered_by_newest, -> { order(created_at: :desc) }
end
