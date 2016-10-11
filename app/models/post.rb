class Post < ApplicationRecord
	has_many :comments
	belongs_to :user
	belongs_to :topic

	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true, length: { minimum: 20 }
	validates :user, :topic, presence: true

#	default_scope { order( created_at: 'desc'  ) } # OK 
	default_scope { order('created_at DESC') }

	def markdown_title
		render_as_markdown(title)
	end

	def markdown_body
		render_as_markdown(body)
	end

private
	def render_as_markdown(markdown)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
	   	extensions = {fenced_code_blocks: true, highlight: true}
	   	redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})
	  	(redcarpet.render(markdown)).html_safe
	  end

end
