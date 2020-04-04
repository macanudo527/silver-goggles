require 'rails_helper'

RSpec.describe "entries/show", type: :view do
  before(:each) do
    @entry = assign(:entry, Entry.create!(
      :word => "Word",
      :reading => "Reading",
      :def => "Def",
      :priority => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Word/)
    expect(rendered).to match(/Reading/)
    expect(rendered).to match(/Def/)
    expect(rendered).to match(/false/)
  end
end
