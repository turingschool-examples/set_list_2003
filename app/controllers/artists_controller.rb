class ArtistsController <ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end

  def create
    new_artist = Artist.new(artist_params)
    if new_artist.save
      flash[:notice] = "Artist created!"
      redirect_to "/artists/#{new_artist.id}"
    else
      flash[:notice] = "Artist not created: Required information missing."
      redirect_to "/artists/new"
    end
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to "/artists"
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    if artist.update(artist_params)
      redirect_to "/artists/#{artist.id}"
    else
      flash[:notice] = "Artist not updated: Required information missing."
      redirect_to "/artists/#{artist.id}/edit"
    end
  end

  private

  def artist_params
    params.permit(:name)
  end
end
