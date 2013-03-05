class Pygmentize < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end

class MarkdownTemplateHandler
  def self.call(template)
    erb = ActionView::Template.registered_template_handler(:erb)
    source = erb.call(template)
    <<-SOURCE
    pygmentized = Pygmentize.new(
      filter_html: true,
      hard_wrap: true
    )
    # renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(pygmentized, options).render(begin;#{source};end)
    SOURCE
  end
end

[:md, :markdown].each do |extension|
  # >= v3.0.5
  if defined? ActionView::Template::Handlers and ActionView::Template::Handlers.respond_to? :register_template_handler
    ActionView::Template::Handlers
  # >= v2.1.0 <= v2.1.0
  elsif defined? ActionView::Template and ActionView::Template.respond_to? :register_template_handler
    ActionView::Template
  # >= v2.2.1 <= v2.3.8
  elsif defined? ActionView::TemplateHandlers and ActionView::TemplateHandlers.respond_to? :register_template_handler
    ActionView::TemplateHandlers
  # <= v2.0.3
  elsif defined? ActionView::Base and ActionView::Base.respond_to? :register_template_handler
    ActionView::Base
  # I give up...
  else
    raise "Couldn't find `register_template_handler' method in ActionView module."
  end.register_template_handler extension, MarkdownTemplateHandler
end
