class PostsController < ApplicationController
  def show
    post_path = Rails.root.join('../assets/posts', params[:id] + '.md')

    if File.exists?(post_path) && !File.directory?(post_path)
      post_content = File.new(post_path, 'r').read
      render json: { full_post_content: post_content }
    else
      render json: { error: "Couldn't retrieve file" }
    end
  end
end
