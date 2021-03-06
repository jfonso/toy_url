class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.paginate(:page => params[:page])
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.create_link(url_params[:original], url_params[:custom]).url
    if @url.persisted?
      redirect_to @url, notice: 'Url was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /urls/1
  # PATCH/PUT /urls/1.json
  def update
    if @url.update_link( url_params[:original], url_params[:custom])
      redirect_to @url, notice: 'Url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:original, :custom)
    end
end
