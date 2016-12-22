class PetsController < ApplicationController
def index
  if logged_in?
    @user_dogs = User.find(@current_user)
  end

end
# show pets
def show
@id = params[:id]
@dog = Pet.find(@id)
end

def create

    @id = params[:id][:it]
    @user1 = params[:id][:it2]
    puts "im hreeeeeeeeeeeeeeee"
    @pet = Store.find(@id)
    current =  Pet.create(
    name: @pet["name"],
    gender: @pet["gender"],
    organisationid: @pet["organisationid"].to_i,
    age: rand(1..3),
    breed: @pet["breed"],
    locationzip: @pet["locationzip"].to_i,
    image: @pet["image"],
    user_id: @user1)
Store.update(@pet, :status => "Not Available")
# byebug
redirect_to "/pets/#{current['id']}"
end


def destroy
    # @user = User.find(params[:id])
    @dog = Pet.find(params[:id])
    @back_to_store = Store.find_by(name: @dog["name"])

    Store.update(@back_to_store['id'], :status => "Available")
    # byebug

    # byebug
    user_dog_id = @dog.user_id
    @user = User.find(user_dog_id)
    @dog.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.xml  { head :ok }
    end
  end

end
