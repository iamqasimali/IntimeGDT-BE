class Provider < ApplicationRecord
  acts_as_taggable_on :categories, :general_category,
                      :sub_category, :keywords, :dataset_formats, :dataset_types,
                      :dataset_geographies, :times, :prices
  belongs_to :user
end
