class StoresController < ApplicationController



  def index
    # @stores = Store.limit(1)
@page = params[:page]
    @stores = Store.all.order("created_at DESC").paginate(page: @page, per_page: 1)
   # byebug
    if @stores[0]["status"] == "Not Available" || @page.to_i == 23
      @page1 = @page.to_i + 1
      @stores = Store.all.order("created_at DESC").paginate(page: @page1, per_page: 1)
   # byebug
    end
       # byebug

# byebug

  end
  def show
    @id = params[:id]
    @dog = Store.find(@id)
  end


  # def create
  #   puts "in create"
  #   pet = Store.find(params[:id])
  #   Store.create(status: "Available",
  #   name: pet["name"],
  #   gender: pet["sex"],
  #   organisationid: pet["orgID"].to_i,
  #   age: rand(1..3),
  #   breed: pet["primaryBreed"],
  #   locationzip: pet["locationZipcode"].to_i,
  #   image: pet["pic1"] )
  # redirect_to "/stores/#{pet['id']}"
  # end

end








