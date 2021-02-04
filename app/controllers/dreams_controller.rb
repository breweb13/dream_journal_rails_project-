class DreamsController < ApplicationController


  def index
    @dreams = Dream.all
  end

  def new
    @dream = Dream.new
  end

  def show
    find_dream
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
    find_dream
  end

  def update
    find_dream
    @dream.update(dreams_params)
    if @dream.valid?
      redirect_to dreams_path
    else
      render :edit
    end
  end

  def destoy
    find_dream
    @dream.destroy
    redirect_to dreams_path
  end

  private

  def dreams_params
    params.require(:dream).permit(:name, :date, :dream, :reflections, :dreamjournals_id)
  end

  def find_dream
    @dream = Dream.find_by_id(params[:id])
end

end
