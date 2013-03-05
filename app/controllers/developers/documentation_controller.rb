class Pygmentize < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end

class Developers::DocumentationController < HighVoltage::PagesController
  prepend_before_filter :authenticate_user!
  layout 'developers'
end
