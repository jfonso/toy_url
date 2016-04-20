require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :identifier => "MyString",
      :url_id => 1
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_identifier[name=?]", "link[identifier]"

      assert_select "input#link_url_id[name=?]", "link[url_id]"
    end
  end
end
