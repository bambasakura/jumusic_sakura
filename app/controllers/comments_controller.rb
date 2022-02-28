class CommentsController < ApplicationController
  
  def create
    
    comment = Comment.new(comment_params)


    if comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(music_id: params[:music_id])

    end
end