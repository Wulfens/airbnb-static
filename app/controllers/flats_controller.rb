require "open-uri"

class FlatsController < ApplicationController
  FLAT_URL = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json".freeze
  before_action :set_flats

  def index
  end

  def show
    @flat = @flats.find do |flat|
      flat["id"] == params[:id].to_i
    end
  end

  private

  def set_flats
    flats_serialized = URI.open(FLAT_URL).read
    @flats = JSON.parse(flats_serialized)
  end
end
