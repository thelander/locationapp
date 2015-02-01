class MarketsController < ApplicationController
  before_action :set_markets

  def index
  end

  private
  def set_markets
    @markets ||= Market.all
  end
end
