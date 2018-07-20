module CopyrightConcern
  extend ActiveSupport::Concern
  def set_copyright
    @copyright = RubyXDevCopyrightTool::Renderer.copyright 'RubyxDev', 'Tout droit réservé'
  end

  module RubyXDevCopyrightTool
    class Renderer
      def self.copyright name, msg
        "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
      end
    end
  end
end