class DreamJournalsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @dreamjournals = DreamJournal.all
  end

  def show
    if !find_dreamjournal
      redirect_to dream_journals_path
    else
      find_dreamjournal
    end
  end

  def new
    @dreamjournal = DreamJournal.new
  end

  def create
    params[:dream_journal][:user_id] = current_user.id
    @dreamjournal = DreamJournal.new(dream_journal_params)

    if @dreamjournal.save
      redirect_to dream_journal_path(@dreamjournal)
    else 
      render :new
    end
  end

  def edit
    find_dreamjournal
  end

  def update
    find_dreamjournal
    @dreamjournal.update(dream_journal_params)
    if @dreamjournal.valid?
      redirect_to dream_journal_path
    else
      render :edit
    end
  end

  def most_recent
    @dreamjournals = DreamJournal.most_recent_dream_journal
    render :index
end

  def destroy
    find_dreamjournal
        if current_user.id != @dreamjournal.user_id
            redirect_to dream_journal_path
        else 
            @dreamjournal.destroy 
            redirect_to dream_journal_path
        end

  end

  private
  
  def dream_journal_params
    params.require(:dream_journal).permit(:title, :user_id )
  end

  def find_dreamjournal
    @dreamjournal = DreamJournal.find_by_id(params[:id])
end

end
