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
    new_artist = Artist.create(artist_params)
    redirect_to "/artists/#{new_artist.id}"
  end

  def destroy
    Artist.destroy(params[:id])
    redirect_to "/artists"
  end

  def edit
    @artist_id = params[:id]
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to "/artists/#{artist.id}"
  end

  private

  def artist_params
    params.permit(:name)
  end
end
