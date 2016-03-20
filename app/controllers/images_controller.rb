class ImagesController < ApplicationController
  def index
    @images = Image.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    if sort && sort_order
      @images = Image.order(sort => sort_order)
    end
  end

  def new
  end

  def create
    image = Image.create(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    flash[:success] = "Image successfully created!"
    redirect_to "/images/#{Image.id}"
  end

  def show
    if params[:id] == "random"
      images = Image.all
      @image = images.sample
    else
      @image = Image.find_by(id: params[:id])
    end
  end

  def edit
    image_id = params[:id]
    @image = Image.find_by(id: Image_id)
  end

  def update
    image_id = params[:id]
    @image = Image.find_by(id: Image_id)
    @image.update(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    flash[:success] = "Image successfully updated!"
    redirect_to "/image/#{@image.id}"
  end

  def destroy
    image_id = params[:id]
    @image = Image.find_by(id: Image_id)
    @image.destroy
    flash[:success] = "Image successfully deleted!"
    redirect_to "/images"
  end

  def search
    search_term = params[:search]
    @images = Image.where("name LIKE ?", "%#{search_term}%")
    render 'index.html.erb'
  end
end
