module MarkdownHelper

  # Turn text to markdown
  #
  # @param text [String] text (in markdown or not)
  # @return [String] markdown turned to html
  def markdown(text)
    rc = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    rc.render(text).html_safe
  end
end
