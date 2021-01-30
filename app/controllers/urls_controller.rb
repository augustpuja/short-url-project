class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
  end

  def create
    @url = Url.create(url_params)
  end

  def clicked
    @url = Url.find( params.require(:url_id) )
    if @url.url_valid?
      @url.clicked += 1
      @url.update_location
      @url.save
    else
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404.html", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end
  end

  private

  def url_params
    params.require(:url).permit(:url)
  end
end
