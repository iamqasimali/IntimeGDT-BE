module Users
  class DetailSerializer
    include JSONAPI::Serializer
    attributes :id, :email, :name, :surname, :phone_number, :driving_license_number, :dob, :is_email_verified, :is_license_verified

    # attribute :name do |object|
    #   "#{object.full_name}"
    # end
  end

  end # class DetailSerializer