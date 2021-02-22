class DreamJournalsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :find_dream_journal
  before_action :redirect_if_not_dreamjournal_owner, only: [:destroy, :edit, :update]
  
  def index
    @dreamjournals = DreamJournal.all
  end

  def show
    if !find_dream_journal
      redirect_to dream_journals_path(@dreamjournal,@dream)
    else
      find_dream_journal
    end
  end

  def most_recent
    @dreamjournals = DreamJournal.most_recent_dream_journal
    render :index
  end

  def new
    @dreamjournal = DreamJournal.new
  end

  def create
    params[:dream_journal][:user_id] = current_user.id
    @dreamjournal = DreamJournal.new(dream_journal_params)
    if @dreamjournal.save
      redirect_to dream_journal_path(@dreamjournal,@dream)
    else 
      render :new
    end
  end

  def edit
    find_dream_journal
  end

  def update
    find_dream_journal
    @dreamjournal.update(dream_journal_params)
    if @dreamjournal.valid?
      redirect_to dream_journal_path(@dreamjournal,@dream)
    else
      render :edit
    end
  end


  def destroy
    find_dream_journal
        if current_user.id != @dreamjournal.user_id
            redirect_to dream_journal_path(@dreamjournal,@dream)
        else 
            @dreamjournal.destroy 
            redirect_to dream_journal_path(@dreamjournal,@dream)
        end

  end

  private
  
  def dream_journal_params
    params.require(:dream_journal).permit(:title, :user_id )
  end

  def find_dream_journal
    @dreamjournal = DreamJournal.find_by_id(params[:id])
  end

  def find_dream
  @dream = Dream.find_by_id(params[:id])
  end

  def redirect_if_not_dreamjournal_owner
    find_dream
    find_dream_journal
    return redirect_to dream_journal_path(@dreamjournal,@dream) unless @dreamjournal
    redirect_to dream_journal_path(@dreamjournal,@dream) unless current_user.id == @dreamjournal.user_id
  end

end
