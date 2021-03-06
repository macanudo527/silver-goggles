class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :clicks
  has_many :links, through: :clicks
  has_many :study_sets
  has_many :study_records
  has_many :user_settings
  has_many :entries, through: :study_records do 
  	def deleted(order = "study_records.updated_at DESC")
      where("study_records.deleted = ?", true).order(order)
  	end
  end

  include Gravtastic
  gravtastic :secure => true,
    :default => "mm"

  after_create :default_settings

  def is_master_warning_showable 
    self.user_settings.find_by(setting_id: 1).unconstrained_value == "true"
  end

  private
    def default_settings
      @user = User.last
      # by default show warnings when user masters a word
      @user.user_settings.create!(setting_id: 1, unconstrained_value: "true", allowed_setting_value: nil)
    end
end
