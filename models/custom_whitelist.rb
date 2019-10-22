class CustomWhitelist
  include Mongoid::Document

  field :postcode, type: String

  before_save :format_postcode

  validates_uniqueness_of :postcode
  validates :postcode, presence: true

  protected

  def format_postcode
    postcode.gsub!(/\s+/, '').downcase!
  end
end