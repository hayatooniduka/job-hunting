class FoldersController < ApplicationController
    before_action :require_user_logged_in
    before_action :correct_user, only: [:destroy]
    
    def index
        @folders = current_user.folders.all
    end
    
    def show
        @folder = Folder.find(params[:id])
        @companies = @folder.companies.all
    end
    
    def new
        @folder = Folder.new
    end
    
    def create
        @folder = current_user.folders.build(folder_params)
        
        if @folder.save
            flash[:success] = 'フォルダーを追加しました'
            redirect_to root_url
        else
            flash.now[:danger] = 'フォルダーの追加に失敗しました'
            render 'toppages/new'
        end
    end
    
    def destroy
        @folder.destroy
        flash[:success] = 'フォルダーを削除しました'
        redirect_to root_url
    end
    
    def edit
    end
    
    def update
    end
    
    private
    
    def folder_params
        params.require(:folder).permit(:title)
    end
    
    def correct_user
        @folder = current_user.folders.find_by(id: params[:id])
        unless @folder
            redirect_to root_url
        end
    end
end
