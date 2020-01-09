class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:new_blog_post].inspect
    # @post = Post.new(params[:new_blog_post])
    @post = Post.new(post_params)

    # set the title to make a slug for our clean url
    # I have created something similar to this in Post Model
    # @post[:slug] = @post[:title].to_s.parameterize

    if @post.save
      redirect_to @post
    else
      render 'new'
    end

    # render plain: @post.inspect
  end

  private def post_params
    # this  is for forbidden attribute error same as laravel's fillable array
    params.require(:new_blog_post).permit(:title, :description, :slug)
  end

  def show
    # I used find_by because I want to find the post by slug not by ID which is I prefer
    # @post = Post.find_by(slug: params[:slug])
    # @post = Post.find_by(title: params[:title])
    @post = Post.find(params[:id])
    # render plain: params[:slug]
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to home_path
  end
end
