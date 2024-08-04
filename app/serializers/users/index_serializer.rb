module Users
  class IndexSerializer < ActiveModel::Serializer
    attributes :id, :client_id, :email, :role,:status, :created_at, :sign_in_count, :last_sign_in_at, :last_sign_in_ip, :last_login

    def name
      "#{object.full_name}"
    end

    def last_login
      object.last_sign_in_at&.strftime('%d-%m-%Y')
    end
  end
end