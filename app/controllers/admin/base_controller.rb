class Admin::BaseController < ApplicationController
  before_filter :check_admin
  
  layout 'admin/base'
  
  def check_admin
  unless (current_user && current_user.admin?)
   render :partial => "shared/admin/not_authorized_admin", :status => :unauthorized
  end
  end
end
