class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :clicks
  has_many :links, through: :clicks
  has_many :study_sets
  has_many :study_records
  has_many :entries, through: :study_records do 
  	def deleted
 		where("study_records.deleted = ?", true)
  	end
  end
end
