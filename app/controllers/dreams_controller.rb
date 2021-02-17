class DreamsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :find_dream_journal
  before_action :find_dream, only: [:show, :destroy]


  def index
    @dreams = Dream.all
    #binding.pry 
  end

  def new
      @dream = Dream.new
   
  end

  def show
    if !find_dream
      redirect_to dream_journal_dreams_path(@dreamjournal)
    else
      find_dream
    end
  end

  def create
    @dream =Dream.new(dreams_params)

    #binding.pry
        #if params[:dream][:dream_journals_id]
            
        #end
        if @dream.save
    
            redirect_to dream_journal_dream_path(@dreamjournal,@dream)
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
      redirect_to dream_journal_dream_path
    else
      render :edit
    end
  end

  def destroy
    @dream.destroy
    redirect_to dream_journal_dream_path
  end

  private

  def dreams_params
    params.require(:dream).permit(:name, :date, :description, :reflections, :dream_journal_id, :feeling_id)
  end

  def find_dream
    @dream = Dream.find_by_id(params[:id])
end

def find_dream_journal
  @dreamjournal = DreamJournal.find_by_id(params[:dream_journal_id])
end

end
