class DreamsController < ApplicationController

  #before_action :find_dream, only: [:show]


  def index
    @dreams = Dream.all
    #binding.pry 
  end

  def new
     @dreamjournal = DreamJournal.find_by_id(params[:dream_journal_id])
      @dream = Dream.new
   
  end

  def show
    if !find_dream
      redirect_to dreams_path
    else
      find_dream
    end
  end

  def create
    @dreamjournal = DreamJournal.find(params[:dream][:dream_journal_id])
    @dream =Dream.new(dreams_params)

    #binding.pry
        #if params[:dream][:dream_journals_id]
            
        #end
        if @dream.save
    
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

  def destroy
    find_dream
    @dream.destroy
    redirect_to dreams_path
  end

  private

  def dreams_params
    params.require(:dream).permit(:name, :date, :description, :reflections, :dream_journal_id, :feeling_id)
  end

  def find_dream
    @dream = Dream.find(params[:id])
end

end
