class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.where("user_id=?", current_user.id).reverse
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
    # @users = User.pluck("id","name")
    @albums = Album.where("user_id=?", current_user.id).pluck("name", "id")
  end

  # GET /images/1/edit
  def edit
    @albums = Album.where("user_id=?", current_user.id).pluck("name", "id")
  end

  # POST /images
  # POST /images.json
  def create
    already_uploaded_images_for_same_album = Image.where("album_id=?",params[:image][:album_id])
    raise Exception.new("You have already uploaded 25 images for the same album, please try to create new album") if already_uploaded_images_for_same_album.count == 25
    @image = Image.new
    @image.image_url = params[:image][:image_url]
    @image.tagline = image_params[:tagline]
    date_params = image_params["created_date(1i)"] + "/" + image_params["created_date(2i)"] + "/" + image_params["created_date(3i)"]
    @image.created_date = date_params
    @image.user_id = current_user.id
    @image.album_id = params[:image][:album_id].to_i
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:image_url, :tagline, :created_date)
    end
end
