class Link < ApplicationRecord
  require 'open-uri'
	belongs_to :source
  has_many :clicks
  has_and_belongs_to_many :entries

end
