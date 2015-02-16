class PetsController < ApplicationController
respond_to :html, :xml, :json
	def index

	end

	def show
		@pet = Pet.find(params[:id])
	end

	def new
		@pet = Pet.new
	end

	def edit
		@pet = Pet.find(params[:id])
	end
  def update
  	@pet = Pet.find(params[:id])
    @pet.update(pet_params)
    respond_with(@pet)
  end

	def create
	    @pet = Pet.new(pet_params)
	    @pet.save
	    respond_with(@pet)
  	end

  	  private

    def set_pet
      @reservation = Reservation.find(params[:id])
    end

    def pet_params
      params.permit(:pet_type, :breed, :name, :summary, :sitter_id)
      params.require(:pet).permit(:pet_type, :breed, :name, :summary, :sitter_id)
    end
end
