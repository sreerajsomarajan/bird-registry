#
# Application Controller.
#
# @author [sreeraj s]
#
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session,
                       if: Proc.new { |c| c.request.format == GlobalConstants::API_FORMAT }

  rescue_from ActionController::RoutingError, with: :path_not_found

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  # Method to handle record not found errors.
  def path_not_found
    render json: {
      error: 'No route matches.'
    }, status: :not_found
  end
end
