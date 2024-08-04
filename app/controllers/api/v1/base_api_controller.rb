# app/controllers/api/v1/base_api_controller.rb
module Api
  module V1
    class BaseApiController < ApplicationController
      respond_to :json
      # include Pundit
      # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      include PaginationConcern
      before_action :clean_params

      def send_response(status=nil, message=nil, data=nil, request_status=nil)
        render json: {status: status, message: message, data: data}, status: request_status
      end

      def serialize_object(object, serializer, data=nil)
        ActiveModelSerializers::SerializableResource.new(
          object,
          serializer: serializer,
          data: data
        )
      end

      def serialize(collection, serializer, data=nil)
        ActiveModelSerializers::SerializableResource.new(
          collection,
          each_serializer: serializer,
          data: data
        )
      end

      private

      def user_not_authorized(e)
        # Sentry.capture_exception(e, tags: {user: current_user&.id, action: action_name, controller: controller_name})
        render json: {
          error: "Unauthorized"
        }, status: :unauthorized
      end

      def clean_params
        params.each do |key, value|
          if value.is_a?(Hash)
            params[key] = deep_compact(value)
          else
            params[key] = value.strip if value.respond_to?(:strip)
          end
        end
      end

      def deep_compact(hash)
        hash.each_with_object({}) do |(key, value), result|
          if value.is_a?(Hash)
            result[key] = deep_compact(value)
          else
            result[key] = value.strip if value.respond_to?(:strip)
          end
        end
      end

    end
  end
end
