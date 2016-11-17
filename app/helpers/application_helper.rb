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

   def form_group_tag(errors, &block)
     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end

   def up_vote_link_classes(post)
   	 base = "glyphicon glyphicon-chevron-up "
   	 vote = current_user.voted(post) 
	 base + (vote && vote.up_vote? ? 'voted' : '')
   end

   def down_vote_link_classes(post)
   	 base = "glyphicon glyphicon-chevron-down "
  	 vote = current_user.voted(post)
   	 base += "voted" if vote && vote.down_vote?
   	 base
   end

end




