class GerendesController < ApplicationController
  def index
    @gerendes = Gerende.all
  end

  def search
    @gerendes = Gerende.search(params)
  end

end
