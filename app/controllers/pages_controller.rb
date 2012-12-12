class PagesController < ApplicationController

  def base_page_processor
    view_prefix = "pages"

    if params[:base_page].present? && template_exists?(params[:base_page], view_prefix)
      render "#{view_prefix}/#{params[:base_page]}"
    else
      #TODO : Notify missing url via email error or error notification service
      render '/public/404.html', :status => 404
    end
  end

end