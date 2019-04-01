require 'rails_helper'

RSpec.describe "feeds/edit", type: :view do
  before(:each) do
    @feed = assign(:feed, Feed.create!(
      :category => "MyText",
      :media => "MyText",
      :title => "MyText",
      :description => "MyText",
      :guid => "MyText",
      :link => "MyText"
    ))
  end

  it "renders the edit feed form" do
    render

    assert_select "form[action=?][method=?]", feed_path(@feed), "post" do

      assert_select "textarea[name=?]", "feed[category]"

      assert_select "textarea[name=?]", "feed[media]"

      assert_select "textarea[name=?]", "feed[title]"

      assert_select "textarea[name=?]", "feed[description]"

      assert_select "textarea[name=?]", "feed[guid]"

      assert_select "textarea[name=?]", "feed[link]"
    end
  end
end
