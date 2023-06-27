class PostsController < ApplicationController
  def index 
      render plain: "Here is a list of posts"
  end

  def show
      render plain: "Here is a single Post"
  end
end
