module ApplicationHelper
  def active_class(link_path)
    "active" if request.fullpath.include? link_path
  end

  def open_collapse(link_path)
    "display: block" if request.fullpath.include? link_path
  end

  def active_link(clase, link)
    "#{clase}" if request.fullpath == link
  end
end
