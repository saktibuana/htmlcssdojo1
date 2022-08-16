class WinnersController < ApplicationController
  before_action :set_winner, only: %i[ show edit update destroy ]

  # GET /winners or /winners.json
  def index
    @winners = Winner.all
  end

  # GET /winners/1 or /winners/1.json
  def show
  end

  # GET /winners/new
  def new
    @winner = Winner.new
  end

  # GET /winners/1/edit
  def edit
  end

  # POST /winners or /winners.json
  def create
    @winner = Winner.new(winner_params)

    respond_to do |format|
      if @winner.save
        format.html { redirect_to winner_url(@winner), notice: "Winner was successfully created." }
        format.json { render :show, status: :created, location: @winner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /winners/1 or /winners/1.json
  def update
    respond_to do |format|
      if @winner.update(winner_params)
        format.html { redirect_to winner_url(@winner), notice: "Winner was successfully updated." }
        format.json { render :show, status: :ok, location: @winner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /winners/1 or /winners/1.json
  def destroy
    @winner.destroy

    respond_to do |format|
      format.html { redirect_to winners_url, notice: "Winner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_winner
      @winner = Winner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def winner_params
      params.require(:winner).permit(:contest_id, :user_id)
    end
end
