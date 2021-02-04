class DreamJournalsController < ApplicationController
  
  def index
    @dreamjournals = DreamJournal.all
  end

  def show
    if !find_dreamjournal
      redirect_to dreamjournals_path
    else
      find_dreamjournal
    end
  end

  def new
    @dreamjournal = DreamJournal.new
  end

  def create
    @dreamjournal = Dreamjournal.new(dreamjournal_params)

    if @dreamjournal.save
      redirect_to dreamjournal_path(@dreamjournal)
    else 
      render:new
    end
  end

  def edit
    find_dreamjournal
  end

  def update
    find_dreamjournal
    @dreamjournal.update(dream_journal_params)
    if @dreamjournal.valid?
      redirect_to dreamjournal_path
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

  def find_dreamjournal
    @dreamjournal = DreamJournal.find_by_id(params[:id])
end

end
