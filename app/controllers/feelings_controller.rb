class FeelingsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @feelings = Feeling.all
    
  end

  def new
    @feeling = Feeling.new
  end

  def show
  end

  def create
    @feeling = Feeling.new(feeling_params)
    if @feeling.save
      redirect_to feelings_path
    else
      render :new
    end
  end

  def edit
    find__feeling
  end

  def update
    find_feeling
    @feeling.update(feelings_params)
    if @feeling.valid?
      redirect_to feelings_path
    else
      render :edit
    end
  end

  def destoy
    find_dream
    @feeling.destroy
    redirect_to feelings_path
  end

  private

  def feelings_params
    params.require(:feeling).permit(:type, :description)
  end

  def find_feeling
    @feeling = Feeling.find(params[:id])
  end
end
