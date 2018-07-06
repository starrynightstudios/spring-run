module MarkdownHelper

  class Markdown

    class << self
      def renderer
        @@renderer ||= Redcarpet::Markdown.new(
          Redcarpet::Render::HTML,
          autolink: false,
          no_intra_emphasis: true,
          tables: true,
          fenced_code_blocks: true,
          filter_html: false,
          with_toc_data: true
        )
      end
    end

  end

  def markdown(content)
    begin
      Markdown.renderer.render(content || '').html_safe
    rescue
      require 'byebug'
      byebug
    end
  end

end
