class Dailymotion
  include Mongoid::Document

  field :refresh_token, type: String

  def self.new
    instance = self.first
    unless instance
      instance = super
      instance.save
    end
    instance
  end

  def self.get_instance
    self.new
  end

  def self.get_refresh_token
    instance = self.get_instance
    instance.refresh_token
  end

  def self.save_refresh_token(refresh_token)
    instance = self.get_instance
    instance.refresh_token = refresh_token
    instance.save
  end

end
