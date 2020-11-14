class PostsController < ApplicationController
  def show
    slug = params[:id]

    post = Post.new(slug)

    render json: {
      title: post.title,
      author: post.author,
      content: post.content
    }
  end

  def index
    slugs = Dir.glob(Rails.root.join('../assets/posts/*')).map { |fn| File.basename(fn, File.extname(fn)) }

    posts = slugs.map do |slug|
      post = Post.new(slug)
      {
        title: post.title,
        slug:  post.slug
      }
    end
    render json: posts
  end
end
