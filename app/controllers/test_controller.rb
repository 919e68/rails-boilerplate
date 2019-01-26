class TestController < ApplicationController
  def index
    render plain: 'plain text'
  end
end