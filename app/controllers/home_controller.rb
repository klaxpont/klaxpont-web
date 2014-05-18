class HomeController < ApplicationController
  def index
    redirect_to "https://www.facebook.com/Klaxpont" unless Rails.env == "development"
  end

end
