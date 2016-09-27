module ApplicationHelper

	def my_name
		"Joe Garcia"
	end

	def active?(path)
		"active" if current_page?(path)
	end


end
