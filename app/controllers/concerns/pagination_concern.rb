module PaginationConcern
  extend ActiveSupport::Concern

  def default_per_page
    10
  end

  def page_no
    params[:page]&.to_i || 1
  end

  def per_page
    params[:per_page].present? && params[:per_page].to_i < 100 ? params[:per_page].to_i : default_per_page
  end

  def paginate_offset
    (page_no - 1) * per_page
  end

  def api_paginate
    ->(it) { it.page(page_no).per(per_page) }
  end

  def paginate_array
    ->(it) { Kaminari.paginate_array(it).page(page_no).per(per_page)}
  end

  def paginate
    ->(it) { it.limit(per_page).offset(paginate_offset) }
  end
end
