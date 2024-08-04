class Api::V1::ProvidersController < Api::V1::BaseApiController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    providers = Provider.all.order(created_at: :desc)&.then(&paginate_array)

    send_response('success', "Providers fetched successfully.", {
      providers: serialize(providers, Providers::IndexSerializer),
      total_pages: providers.total_pages,
      page: params[:page] || 1
    }, 200)
  end

end