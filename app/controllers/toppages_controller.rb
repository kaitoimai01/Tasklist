class ToppagesController < ApplicationController
  def index
    @tasks = Task.all
  end
end
