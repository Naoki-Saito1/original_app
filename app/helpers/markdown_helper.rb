module MarkdownHelper
  def markdown(portfolio_body)
    options = {
    filter_html: true,
    hard_wrap: true,
    space_after_headers: true,
    with_toc_data: true,
    no_images:     true,
    no_styles:     true,
    }
    extensions = {
    autolink: true,
    no_intra_emphasis: true,
    fenced_code_blocks: true,
    tables: true,
    lax_spacing: true,
    space_after_headers: true
    
    }
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(portfolio_body).html_safe 

    
  end
end