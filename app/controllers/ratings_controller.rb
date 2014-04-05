class RatingsController < ApplicationController

  # POST /ratings
  # POST /ratings.json
  def create
    @idea = Idea.find params[:idea_id]
    @rating = Rating.new(rating_params)
    @rating.idea = @idea

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render action: 'show', status: :created, location: @idea }
      else
        format.html { render action: 'show', controller: "ideas" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:mark)
    end
end
