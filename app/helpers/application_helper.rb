module ApplicationHelper

	def share_form_title(form)
		"Checkout my form on FreeFlowForm"
	end
	
	def share_form_display_text(filled_form)
		"Share this with your circle!"
	end
	
	def share_form_url(filled_form)
		return filled_form_url(filled_form)
	end
	
	def title
		if defined?(@title)
			return @title
		else	
			return params[:action].titleize
		end
	end
	
	def logo
		s = image_tag('rails.png', :alt => "Free Flow Form")
		return s
	end
	
	# renders set of hidden fields and button to add new record using nested_attributes
  def link_to_add_fields(name, append_to_selector, f, association, callback, options={})
    new_object = f.object.class.reflect_on_association(association).klass.new
    obj = nil
    #eval("new_object.#{f.object.class.to_s.underscore} = f.object")
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      obj = builder.object
      render("#{f.object.class.to_s.underscore.pluralize}/"+association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, raw("#{callback}(\"#{append_to_selector}\", \"#{association}\", \"#{escape_javascript(fields)}\",\"#{obj.id}\",\"#{f.object.id}\")"), :class => 'add_fields', :content => "#{fields}", :object_id => "#{obj.id}", :style => options[:style])
  end
  
  
	def resource_name
    :user
  end
  
  def resource_class
    User
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
