#
# ApiConstraints for versioning of APIs
#
# @author [sreeraj s]
#
class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def matches?(req)
    @default ||
      req.headers['Accept'].include?("application/bird-registry.v#{@version}")
  end
end
