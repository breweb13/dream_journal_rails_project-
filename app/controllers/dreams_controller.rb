class DreamsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :find_user_dreams, only: [:index]
  before_action :find_dream_journal
  before_action :redirect_if_not_dreamjournal_owner, only: [:destroy, :edit, :update]
  


  def index
  end

  def show
    if !find_dream
      redirect_to dream_journal_dreams_path(@dreamjournal,@dream)
    else
      find_dream
    end
  end

  def new
    @dream = Dream.new
 end

  
  def create
    @dream =Dream.new(dreams_params)
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
      redirect_to dream_journal_dream_path(@dreamjournal,@dream)
    else
      render :edit
    end
  end

  def destroy
    @dream.destroy
    redirect_to dream_journal_dream_path(@dreamjournal,@dream)
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

def find_user_dreams
  @dreams = Dream.where(dream_journal_id: params[:dream_journal_id])
end


def redirect_if_not_dreamjournal_owner
  find_dream
  find_dream_journal
  return redirect_to dream_journal_dream_path(@dreamjournal,@dream) unless @dreamjournal
  redirect_to dream_journal_dream_path(@dreamjournal,@dream) unless current_user.id == @dreamjournal.user_id
end

end
