module Providers
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :source_name, :logo_link, :website_link, :data_use_agreement_link, :dataset_available,
               :short_site_description, :user_id, :created_at, :category_list, :general_category_list, :sub_category_list, :keyword_list,
               :dataset_format_list, :dataset_type_list, :dataset_geography_list, :time_list, :price_list

  end
end