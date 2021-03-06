module ApplicationHelper
	#style flash messages, error messages and alerts
	def bootstrap_class_for(flash_type)
		if flash_type == "alert" || flash_type == "error"
			"alert alert-dismissable alert-danger"
		elsif flash_type == "notice"
			"alert alert-dismissable alert-success"
		elsif flash_type == "warning"
			"alert alert-dismissable alert-warning"
		else
			flash_type.to_s
		end
	end

	def form_error_messages(resource)
		return '' if resource.errors.empty?
		messages = resource.errors.full_messages.map { |message| 
			content_tag(:li, message)
		}.join

		html = <<-HTML 
			<div class="alert alert-danger alert-block"> 
				<button type="button" class="close" data-dismiss="alert">x</button> 
				#{messages} 
			</div> 
		HTML

		html.html_safe
	end
end
