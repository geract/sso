# frozen_string_literal: true

class Api::V1::OwnersController < Api::V1::BaseController
  def show
    respond_with current_resource_owner
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
