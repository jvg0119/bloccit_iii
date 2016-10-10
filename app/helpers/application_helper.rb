module ApplicationHelper

	def my_name
		"Joe Garcia"
	end

	def active?(path)
		"active" if current_page?(path)
	end

#	def markdown_to_html(text)
		#Markdown.new(text, :hard_wrap).to_html.html_safe
#		options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
#		Markdown.new(text, *options).to_html.html_safe
#	end

	def markdown_to_html(markdown)
	  renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
	  extensions = {fenced_code_blocks: true, highlight: true}
	  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
	  (redcarpet.render markdown).html_safe
	end


end
