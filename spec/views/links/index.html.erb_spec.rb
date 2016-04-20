require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :identifier => "Identifier #1",
        :url_id => 1
      ),
      Link.create!(
        :identifier => "Identifier #2",
        :url_id => 2
      )
    ])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => "Identifier #1".to_s, :count => 1
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => "Identifier #2".to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 1
  end
end
