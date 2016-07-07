# To handle all common methods for APIs
#
# @author [sreeraj s]
#
module ApiConcern
  extend ActiveSupport::Concern

  # Common response for API requests.
  def common_response(message, opt = {})
    res = {
      success: @success, # Defined in the BaseApiController
      message: (message.is_a?(String) ? message.split(',') : message)
    }
    res = res.merge! opt if opt.present?
    if @success
      render json: res, status: :ok
    else
      render json: res, status: :unprocessable_entity
    end
  end
end
