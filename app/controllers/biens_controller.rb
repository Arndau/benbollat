class BiensController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR country ILIKE :query"
      @biens = policy_scope(Bien).where(sql_query, query: "%#{params[:query]}%")
    else
      @biens = policy_scope(Bien)
      # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
      @markers = @biens.geocoded.map do |bien|
        {
          lat: bien.latitude,
          lng: bien.longitude,
          html: render_to_string(partial: "bien_marker", locals: { user: bien.user, bien: bien}),
          info_window: render_to_string(partial: "info_window", locals: { bien: bien })
        }
      end
    end
  end

  def userbiens
    @biens = policy_scope(Bien)
    @biens_mine = @biens.where(user: current_user)
    authorize @biens
  end

  def show
    @bien = Bien.find(params[:id])
    authorize @bien
  end

  def new
    @bien = Bien.new
    authorize @bien
  end
  def create
    @bien = Bien.new(bien_params)
    @bien.user=current_user
    # raise
    @bien.save!
    redirect_to biens_path(@bien)
    authorize @bien
  end

  def edit
    @bien = Bien.find(params[:id])
    authorize @bien
  end

  def update
    @bien = Bien.find(params[:id])
    @bien.update(bien_params)
    redirect_to userbiens_biens_path(@restaurant)
    authorize @bien
  end

  def destroy
    @bien = Bien.find(params[:id])
    @bien.destroy
    redirect_to userbiens_biens_path
    authorize @bien
  end

  private

  def bien_params
    params.require(:bien).permit(:ville, :address, :loyé, :meublé, :saisonnié, :disponible, images: [])
  end

end
