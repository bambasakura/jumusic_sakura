class MusicsController < ApplicationController


    def about
      
    end

    def show
        @music = Music.find(params[:id])
        
        @comments = @music.comments
        @comment = Comment.new
    end

    def new
        @musics = Music.new
    end

    def index
        if params[:search] == nil
            @musics = Music.order("created_at DESC").page(params[:page]).per(8)
          elsif params[:search] == ''
            @musics = Music.order("created_at DESC").page(params[:page]).per(8)
          else
            
            @musics = Music.order("created_at DESC").where("country LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(8)
          end
    end

    def create
        musics = Music.new(music_params)

        
        if musics.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      private
      def music_params
        params.require(:music).permit(:title,:url,:singer,:comment,:country,:image,)
      end
    
end


