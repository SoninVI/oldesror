class HomeController < ApplicationController

  def index
    @post = Post.all
    @slider = Slider.all
    @about_home = AboutHome.all
    @service = Service.all
  end

end
