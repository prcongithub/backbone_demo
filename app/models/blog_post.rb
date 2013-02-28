class BlogPost
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :published_on, type: Time
  field :tags, type: String
end
