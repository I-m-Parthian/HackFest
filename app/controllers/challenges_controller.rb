class ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[ show edit update destroy upvote]

  # GET /challenges or /challenges.json
  def index
    @challenges = Challenge.all
  end

  # GET /challenges/1 or /challenges/1.json
  def show
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
  end

  # POST /challenges or /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    
    respond_to do |format|
      if @challenge.save
        flash[:notice] = "Challenge was successfully created!!"
        format.html { redirect_to controller: 'challenges', action: 'index'}
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1 or /challenges/1.json
  def update
    respond_to do |format|
      if @challenge.update(challenge_params)
        format.html { redirect_to @challenge, notice: "Challenge was successfully updated." }
        format.json { render :show, status: :ok, location: @challenge }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1 or /challenges/1.json
  def destroy
    @challenge.destroy
    respond_to do |format|
      format.html { redirect_to challenges_url, notice: "Challenge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # upvote a challenge/1
  def upvote
    if @challenge.employee_id != current_employee.id
      @validate = Upvote.where({employee_id: current_employee.id, challenge_id: @challenge.id})
      if @validate.blank?  
        @vote = Upvote.new({:employee_id => current_employee.id, :challenge_id => @challenge.id})
        @vote.save
        @challenge.increment!(:votes)
        flash[:notice] = "Challenge Upvoted"
      else
        flash[:alert] = "Already Upvoted"
      end
    else
      flash[:alert] = "Can't upvote own challenge"
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challenge_params
      params.require(:challenge).permit(:title, :description, :tags, :employee_id)
    end
end
