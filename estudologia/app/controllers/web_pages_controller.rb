class WebPagesController < ApplicationController
  before_action :set_web_page, only: %i[show edit update destroy]
  caches_action :show, :new, :edit

  # GET /web_pages
  # GET /web_pages.json
  def index
    @web_pages = WebPage.all
  end

  # GET /web_pages/1
  # GET /web_pages/1.json
  def show
  end

  # GET /web_pages/new
  def new
    @web_page = WebPage.new
  end

  # GET /web_pages/1/edit
  def edit
  end

  # POST /web_pages
  # POST /web_pages.json
  def create
    @web_page = WebPage.new(web_page_params)

    respond_to do |format|
      if @web_page.save
        format.html { redirect_to @web_page, notice: t("create_web_page_success") }
        format.json { render :show, status: :created, location: @web_page }
      else
        format.html { render :new }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_pages/1
  # PATCH/PUT /web_pages/1.json
  def update
    respond_to do |format|
      if @web_page.update(web_page_params)
        format.html { redirect_to @web_page, notice: t("update_web_page_success") }
        format.json { render :show, status: :ok, location: @web_page }
      else
        format.html { render :edit }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_pages/1
  # DELETE /web_pages/1.json
  def destroy
    @web_page.destroy
    respond_to do |format|
      format.html { redirect_to web_pages_url, notice: t("destroy_web_page_success") }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_web_page
    @web_page = WebPage.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def web_page_params
    params.require(:web_page).permit(:title, :description, :body, :author)
  end
end
