# frozen_string_literal: true

class Admins::BaseController < ApplicationController
	before_action :authenticate_admin!
	layout 'admin'

  private

  def authenticate_admin!
  	return if current_user.admin?

  	authenticated_root_path
  end
end
