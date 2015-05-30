class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def products
    @products = Product.all
  end

  def home
    @products_for_featured = Product.all
    # @products = Product.all
    @products = Product.search(params[:search]).paginate(page: params[:page], :per_page => 7)
    @order_item = current_order.order_items.new

  end
  # GET /products
  # GET /products.json
  def index
    # @products = Product.all
    @products = Product.all
    @order_item = current_order.order_items.new
    # @products = Product.search(params[:search])
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @products = Product.all
    @order_item = current_order.order_items.new

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def upload
  #   uploaded_io = params[:upload]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end
  #
  # def upload
  #   upload = params[:upload]
  #   if upload!=nil and upload['datafile']!=nil
  #     file = Product.new
  #     # file.category_id = upload[:category_id]
  #     file.image_url = upload['datafile'].original_filename
  #     if file.save
  #       if(file.image_url.include? '.jpg')
  #         post = DataFile.saveFile(upload, file.id.to_s+'.jpg')
  #         message = "File has been uploaded successfully"
  #         flash[:success] = message
  #       elsif(file.image_url.include? '.png')
  #         post = DataFile.saveFile(upload, file.id.to_s+'.png')
  #         message = "File has been uploaded successfully"
  #         flash[:success] = message
  #       elsif(file.image_url.include? '.jpeg')
  #         post = DataFile.saveFile(upload, file.id.to_s+'.jpeg')
  #         message = "File has been uploaded successfully"
  #         flash[:success] = message
  #       else
  #         message = "File must be JPG format or PNG format"
  #         flash[:danger] = message
  #       end
  #     else
  #       message = "Eror while saving file"
  #       flash[:danger] = message
  #     end
  #   else
  #     message = "No file Selected"
  #     flash[:danger] = message
  #   end
  #   redirect_to root_path
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :year, :author, :papers_count, :format, :description, :image_url, :subcategory_id)
    end
end
