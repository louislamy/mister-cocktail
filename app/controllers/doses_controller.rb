class DosesController < ApplicationController
  before_action :find_cocktail, except: [:destroy]

   def new
    @dose = Dose.new
   end

  def create
   @dose = @cocktail.doses.build(create_params)
   @dose.save
   if @dose.save
     redirect_to cocktail_path(@cocktail)
   else
     render :new
   end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

 private

 def create_params
   params.require(:dose).permit(:description, :ingredient_id)
 end

 def find_cocktail
   @cocktail = Cocktail.find(params[:cocktail_id])
 end
end
