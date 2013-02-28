require 'spec_helper'

describe "blog_posts/show" do
  before(:each) do
    @blog_post = assign(:blog_post, stub_model(BlogPost,
      :title => "Title",
      :content => "MyText",
      :tags => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
