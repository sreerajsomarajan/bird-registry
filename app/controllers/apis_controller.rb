#
# Base Controller for all versions of APIs
#
# @author [sreeraj s]
#
class ApisController < ApplicationController
  layout false

  skip_before_action :verify_authenticity_token

  respond_to :json

  rescue_from Exception, with: :generic_exception
  rescue_from Mongoid::Errors::DocumentNotFound, with: :record_not_found

  private

  # Method to handle generic exceptions.
  def generic_exception(error)
    render json: {
      error: error.message
    }, status: :internal_server_error
  end

  # Method to handle record not found errors.
  def record_not_found
    render json: {
      error: 'Record not found.'
    }, status: :not_found
  end
end
