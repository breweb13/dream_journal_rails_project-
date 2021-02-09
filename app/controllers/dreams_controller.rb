class DreamsController < ApplicationController

  #before_action :find_dream, only: [:show]


  def index
    @dreams = Dream.all
    #binding.pry 
  end

  def new
    if params[:dream_journal_id] && @dreamjournal = DreamJournal.find(params[:dream_journal_id])
      @dream = Dream.new(dream_journal_id: params[:dream_journal_id])
   else
      @dream = Dream.new
   end
  end

  def show
    if !find_dream
      redirect_to dreams_path
    else
      find_dream
    end
  end

  def create
    @dream =Dream.new(dreams_params)
        if params[:dream_journal_id]
            @dream = DreamJournal.find(params[:dream_journal_id])
        end
        if @dream.save
          binding.pry
            redirect_to dreams_path
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
    params.require(:dream).permit(:name, :date, :description, :reflections, :dream_journals_id, dream_journal_attributes: [:title, :user_id])
  end

  def find_dream
    @dream = Dream.find(params[:id])
end

end
