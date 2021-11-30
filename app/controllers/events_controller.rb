class EventsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :update]
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      flash[:success] = 'イベントを追加しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'イベントの追加に失敗しました'
      render 'toppages/index'
    end
  end
  
  def destroy
    @event.destroy
    flash[:success] = 'イベントを削除しました'
    redirect_to root_url
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    if @event.update(event_params)
      flash[:success] = 'イベントが正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'イベントが更新されませんでした'
      render :edit
    end
  end
  
  private
  
  def event_params
      params.require(:event).permit(:title, :content, :start_time)
  end
  
  def correct_user
    @event = current_user.events.find_by(id: params[:id])
    unless @event
      redirect_to root_url
    end
  end
  
end
