require 'rails_helper'

RSpec.describe "urls/show", type: :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :original => "Original"
    ))
    Link.create!(
     identifier: "Identifier",
     url_id: @url.id
    )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Original/)
  end
end
