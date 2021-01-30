class Url < ApplicationRecord
  serialize :country, Array
  validates_presence_of :url
  validates_uniqueness_of :short_url

  before_create :generate_short_url, :update_location, :set_url_expiration

  def generate_short_url
    self.short_url = SecureRandom.alphanumeric(5) if self.short_url.nil? || self.short_url.empty?
  end

  def set_url_expiration
    self.expire_at = DateTime.now + 30.days
  end

  def update_location
    self.ip_address = Socket.ip_address_list.detect(&:ipv4_private?)&.ip_address || "127.0.0.1"
    result = Geocoder.search(self.ip_address)
    country = result.first.country ? result.first.country : "IN"
    self.country << country unless self.country.include?(country)
  end

  def url_valid?
    self.expire_at >= DateTime.now
  end

end
