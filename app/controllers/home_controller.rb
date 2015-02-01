class HomeController < ApplicationController
  def index
    redirect_to markets_path if signed_in?
  end
end
