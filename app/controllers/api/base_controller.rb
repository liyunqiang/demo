class Api::BaseController < ApplicationController
  include RenderJson

  def meta
    @meta || {}
  end
end