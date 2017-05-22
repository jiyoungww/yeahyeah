class HomeController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def write
    
  end

  def create
    Post.create(writer: params[:irum], content: params[:naeyong])
    # newpost = Post.new
    # newpost.writer = params[:irum]
    # newpost.content = params[:naeyong]    
    # newpost.save
    redirect_to :root
  end
  
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to "/home/index"
  end
  
  def update_view
   @one_post = Post.find(params[:id])
  end
  
  def update
    pp = Post.find(params[:id])
    pp.writer = params[:irum]
    pp.content = params[:naeyong]
    pp.save
    redirect_to :root
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:content]
    reply.post_id = params[:id_of_post]
    reply.save
    
    redirect_to '/home/index'
  end
  
  def rpdestroy
    @two_post = Reply.find(params[:id])
    @two_post.destroy
    redirect_to "/home/index"
  end
  
  def rpupdate_view
    @reply = Reply.find(params[:id])
  end

  def reply_update
    reply = Reply.find(params[:id])
    reply.content = params[:content]
    reply.save
    
    
    redirect_to :root
  end  
end
