require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      :identifier => "MyString",
      :url_id => 1
    ))
  end

  it "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input#link_identifier[name=?]", "link[identifier]"

      assert_select "input#link_url_id[name=?]", "link[url_id]"
    end
  end
end
