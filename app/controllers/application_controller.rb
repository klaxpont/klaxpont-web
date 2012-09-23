class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from Exception, :with => :error_render_method

  def error_render_method(e, code = 500)
    Rails.logger.error e.backtrace.join("\n") + "\n"
    Rails.logger.error e.message
    
 
    render_error(e.message, code)
    true
  end

  def render_error(message, code)
    @message = message
    @code = code
    render :partial => 'shared/errors'
  end

end
