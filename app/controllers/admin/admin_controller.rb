class Admin::AdminController < ApplicationController
  before_action :check_user_authentication
  layout 'admin_layout'
end
