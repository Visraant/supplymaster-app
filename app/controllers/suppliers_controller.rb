class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    if sort && sort_order
      @suppliers = Supplier.order(sort => sort_order)
    end
  end

  def new
  end

  def create
    supplier = Supplier.create(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    flash[:success] = "Supplier successfully created!"
    redirect_to "/suppliers/#{Supplier.id}"
  end

  def show
    if params[:id] == "random"
      suppliers = Supplier.all
      @supplier = suppliers.sample
    else
      @supplier = Supplier.find_by(id: params[:id])
    end
  end

  def edit
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: Supplier_id)
  end

  def update
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: Supplier_id)
    @supplier.update(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    flash[:success] = "Supplier successfully updated!"
    redirect_to "/suppliers/#{@supplier.id}"
  end

  def destroy
    supplier_id = params[:id]
    @supplier = Supplier.find_by(id: Supplier_id)
    @supplier.destroy
    flash[:success] = "Supplier successfully deleted!"
    redirect_to "/suppliers"
  end

  def search
    search_term = params[:search]
    @suppliers = Supplier.where("name LIKE ?", "%#{search_term}%")
    render 'index.html.erb'
  end
end
