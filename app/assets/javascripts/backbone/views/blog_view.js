var BlogView = Backbone.View.extend({
	initialize: function() {
		this.listenTo(this.model, "change", function(){
    	this.render();
   	});
  },

  render: function() {
  	var html = ich.template_blog(this.model.attributes);
  	if($("#tr_blog_"+this.model.get("_id")).length == 0){
  		$("#tbody_blogs").append(html);
  	}else{
  		$("#tr_blog_"+this.model.get("_id")).replaceWith(html);
  	}
  	return this;
  },
});
