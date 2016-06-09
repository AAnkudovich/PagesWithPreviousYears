class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index

    @pages = Page.where(parentPage: nil )
    respond_to do |format|
      format.html
      format.pdf do 
        
        render pdf: "Commentaries"
      end
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
   
    respond_to do |format|
      format.html
      format.pdf do 
        
        render pdf: @page.title
      end

    end
  end

  # GET /pages/new
  def new
    @page = Page.new
    @pages = Page.all
  end

  # GET /pages/1/edit
  def edit
    @pages = Page.all
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    if @page.parentPage != nil 
    @parentPage = Page.find(@page.parentPage)
    @page.slug = @parentPage.slug + "/" + @page.title.parameterize
  else
    @page.slug = @page.title.parameterize
  end
    

    respond_to do |format|
      if @page.save
        format.html { redirect_to :back, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      # allow for later assignment of parent page
      if @page.update(page_params)
        pageHash= Hash.new
        if @page.parentPage != nil
          @parentPage = Page.find(@page.parentPage)

          if !@page.slug.include? @parentPage.slug
              
              
              pageHash["slug"]=@parentPage.slug + "/" + @page.title.parameterize
              
            end
            else
            pageHash["slug"] = @page.title.parameterize
          end
          @page.update(pageHash)

        @childpages = Page.where(parentPage: @page.id)
        @childpages.each do |childpage|
          childUpdateHash = Hash.new
          @makeTitleintoURL = childpage.title.parameterize
          childUpdateHash["slug"]=[@page.slug, @makeTitleintoURL].join("/")
          childpage.update(childUpdateHash)

          @grandchildpages = Page.where(parentPage: childpage.id)
            @grandchildpages.each do |grandchildpage|
              grandchildUpdateHash = Hash.new
              @makeTitleintoURLgrand = grandchildpage.title.parameterize
              grandchildUpdateHash["slug"]=[childpage.slug, @makeTitleintoURLgrand].join("/")
              grandchildpage.update(grandchildUpdateHash)

            end
        end
        format.html { redirect_to pages_url, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content, :slug, :parentPage, :template)
    end
end
