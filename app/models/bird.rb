#
# Model Bird
#
# @author [sreeraj s]
#
class Bird
  include Mongoid::Document
  field :name, type: String
  field :family, type: String
  field :continents, type: Array
  field :added, type: String, default: Time.now.utc
  field :visible, type: Boolean, default: false

  validates_presence_of :name, :family, :continents

  before_save do |d|
    d.continents = d.continents.uniq
  end
end
