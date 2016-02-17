class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]

  skip_before_filter :authenticate_user!, only: [:show]

  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {}
      format.rdf { render rdf: @paper  }
    end
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:title, :author1first, :author1mid, :author1last, :author1workplace, :author2first, :author2mid, :author2last, :author2workplace, :author3first, :author3mid, :author3last, :author3workplace, :author4first, :author4mid, :author4last, :author4workplace, :author5first, :author5mid, :author5last, :author5workplace, :abstract, :creationdate, :sectionurlid, :papernumber, :filefunction, :jel, :keywords, :suppress, :wpid, :series_id)
    end
end
