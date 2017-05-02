class PagesController < ApplicationController
  include HighVoltage::StaticPage

  layout "landing"
end
