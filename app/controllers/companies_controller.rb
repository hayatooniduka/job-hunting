class CompaniesController < ApplicationController
    before_action :require_user_logged_in
    
    def index
        @companies = Company.all
    end
    
    def show
        @company = Company.find(params[:id])
    end
    
    def new
        @company = Company.new
    end
    
    def create
        @company = Company.new(company_params)
        if @company.save
            flash[:success] = '新規会社を追加しました'
            redirect_to root_url
        else
            flash.now[:danger] = '会社の追加に失敗しました'
            render :new
        end
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
    end
    
    private
    
    def company_params
        params.require(:company).permit(:name, :founded, :philosophy, :number, :content, :time, :rival, :remarks, :folder_id)
    end
        
end
