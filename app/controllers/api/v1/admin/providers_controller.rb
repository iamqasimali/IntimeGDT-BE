class Api::V1::Admin::ProvidersController < Api::V1::BaseApiController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    providers = Provider.all.order(created_at: :desc)
    send_response('success', "Providers fetched successfully.", {
      providers: serialize(providers, Providers::IndexSerializer),
    }, 200)
  end

end