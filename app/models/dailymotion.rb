class Dailymotion
  include Mongoid::Document

  field :refresh_token, type: String

  def self.get_dailymotion
    dailymotion = self.first
    unless dailymotion
      dailymotion = Dailymotion.new
    end
    dailymotion
  end

  def self.get_refresh_token
    dailymotion = self.get_dailymotion
    dailymotion.refresh_token
  end

  def self.save_refresh_token(refresh_token)
    dailymotion = self.get_dailymotion
    dailymotion.refresh_token = refresh_token
    dailymotion.save
  end

end
