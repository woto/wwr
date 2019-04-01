require 'rails_helper'

RSpec.describe "feeds/index", type: :view do
  before(:each) do
    assign(:feeds, [
      Feed.create!(
        :category => "MyText",
        :media => "MyText",
        :title => "MyText",
        :description => "MyText",
        :guid => "MyText",
        :link => "MyText"
      ),
      Feed.create!(
        :category => "MyText",
        :media => "MyText",
        :title => "MyText",
        :description => "MyText",
        :guid => "MyText",
        :link => "MyText"
      )
    ])
  end

  it "renders a list of feeds" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
