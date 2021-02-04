class DreamsController < ApplicationController


  def index
    @dreams = Dream.all
  end

  def new
    @dream = Dream.new
  end

  def show
    @dream = Dream.findby(id params[:id])
  end

  def create
    @dream = Dream.new(dreams_params)
    if @dream.save
      redirect_to @dream
    else
      render :new
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])

    if @dream.update(dreams_params)
      redirect_to @dream
    else
      render :edit
    end
  end

  def destoy
    @dream = Dream.find(params[:id])
    @dream.destroy
  end

  private

  def dreams_params
    params.require(:dream).permit (:name, :date, :dream, :reflections, :dreamjournals_id)
  end


end
