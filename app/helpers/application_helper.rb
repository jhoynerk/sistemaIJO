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

  def class_tr(status)
    case status
    when 0
      'yellow lighten-5'
    when 1
      'blue lighten-5'
    when 2
      'green lighten-5'
    when 3
      'red lighten-5'
    end
  end

  def custom_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      type = 'info'    if type == 'notice'
      #text = "<script>$(document).on('page:load ready', function(){ toastr.options = {'closeButton': true,'debug': false,'newestOnTop': false,'progressBar': false,'positionClass': 'toast-bottom-center','preventDuplicates': false,'onclick': null,'showDuration': '300','hideDuration': '1000','timeOut': '0','extendedTimeOut': '1000','showEasing': 'swing','hideEasing': 'linear','showMethod': 'fadeIn','hideMethod': 'fadeOut', 'tapToDismiss': false}; toastr.#{type}('#{message}');});</script>"
      text = "<script>$(document).on('page:load ready', function(){ toastr.options = {'closeButton': true,'debug': false,'newestOnTop': true,'progressBar': false,'positionClass': 'toast-top-right','preventDuplicates': false,'onclick': null,'showDuration': '300','hideDuration': '1000','timeOut': 0,'extendedTimeOut': 0,'showEasing': 'swing','hideEasing': 'linear','showMethod': 'fadeIn','hideMethod': 'fadeOut','tapToDismiss': false}; toastr.#{type}('#{message}');});</script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end

  def custom_errors(object)
    flash_messages = []
    if object.full_messages.any?
      object.full_messages.each do |msg|
        text = "<script> $(document).on('page:load ready', function(){ toastr.options = {'closeButton': true,'debug': false,'newestOnTop': false,'progressBar': false,'positionClass': 'toast-bottom-center','preventDuplicates': false,'onclick': null,'showDuration': '300','hideDuration': '1000','timeOut': '5000','extendedTimeOut': '1000','showEasing': 'swing','hideEasing': 'linear','showMethod': 'fadeIn','hideMethod': 'fadeOut'};  toastr.error("+'"'+msg+'"'+");});</script>"
        flash_messages << text.html_safe if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

end
