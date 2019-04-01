require 'rails_helper'

RSpec.describe "feeds/new", type: :view do
  before(:each) do
    assign(:feed, Feed.new(
      :category => "MyText",
      :media => "MyText",
      :title => "MyText",
      :description => "MyText",
      :guid => "MyText",
      :link => "MyText"
    ))
  end

  it "renders new feed form" do
    render

    assert_select "form[action=?][method=?]", feeds_path, "post" do

      assert_select "textarea[name=?]", "feed[category]"

      assert_select "textarea[name=?]", "feed[media]"

      assert_select "textarea[name=?]", "feed[title]"

      assert_select "textarea[name=?]", "feed[description]"

      assert_select "textarea[name=?]", "feed[guid]"

      assert_select "textarea[name=?]", "feed[link]"
    end
  end
end
