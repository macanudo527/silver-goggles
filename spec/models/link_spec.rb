require 'rails_helper'

RSpec.describe Link, type: :model do

  describe "refresh links" do

  	let(:link) { Link.new }

    it "reads the rss feed into the db" do
      expect(Link).to respond_to(:news)
      
    end
    
  end

end
