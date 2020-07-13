# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :post, only: %i[create destroy]

  def create
    @comment = post.comments.create(comments_params)

    redirect_to post_path(@post)
  end

  def destroy
    @comment = post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private

  def post
    @post = Post.find(params[:post_id])
  end

  def comments_params
    params[:comment].permit(:name, :body)
  end
end
