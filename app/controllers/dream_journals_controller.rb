class DreamJournalsController < ApplicationController
  
  def index
    @dreamjournals = DreamJournal.all
  end

  def show
    @dreamjournal = Dreamjournal.find(params[:id])
  end

  def new
    @dreamjournal = DreamJournal.new
  end

  def create
    @dreamjournal = Dreamjournal.new(dreamjournal_params)

    if @dreamjournal.save
      redirect_to @dreamjournal
    else 
      render:new
    end
  end

  def edit
    @dreamjournal = @dreamjournal.find(params[:id])
  end

  def update
    @dreamjournal = Dreamjournal.find(params[:id])
  
    if @dreamjournal.update(dream_journal_params)
      redirect_to @dreamjournal
    else
      render :edit
    end
  end

  def destroy
  end

  private
  
  def dream_journal_params
    params.require(:dreamjournal).permit(:title, :user_id )
  end

end
