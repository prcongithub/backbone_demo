var BlogPost = Backbone.Model.extend({
	defaults: {
    "title":  null,
    "content":     null,
    "published_on":    null,
    "tags":    null
  },
  
  idAttribute: "_id",
  urlRoot: "/blog_posts",
	
	initialize: function(){
		console.log("Initializing blog_post");
	},
	
	getTitle: function(){
		alert("Hello");
	}
});

var BlogPostsCollection = Backbone.Collection.extend({
  model: BlogPost,
  url: '/blog_posts',
  
  defaults: {
  },
  
  initialize: function() {
  },
  
  render: function() {
  	_.each(this.models,function(blog){
  		var blogView = new BlogView({ model: blog });
  		blogView.render();
		});
  }
});

var blogs = new BlogPostsCollection();
blogs.fetch({
	success: function(collection,response,options) {
		showNotice("Blogs received...");
		collection.render();
	},
	error: function(collection,jqxhr,options) {
		showNotice("Failed to get blogs...");
	}	
});

