#
# GlobalConstants module for all global constants.
#
# @author [sreeraj s]
#
module GlobalConstants
  # API constants
  API_FIRST_VERSION = 'application/bird-registry.v1'.freeze
  API_FORMAT = 'application/json'.freeze

  # Path of messages folder
  MSG_PATH = "#{Rails.root}/config/messages/".freeze

  freeze
end
