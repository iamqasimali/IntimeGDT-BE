# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Importing Admin User in the database process starting......"
unless User.where(email: "admin@intimegdt.com").present?
  User.create(role: "admin", name: "Intime GDT", surname: "Admin", email: "admin@intimegdt.com", password: "Admin@123")
end

puts "Admin User successfully imported in the database......"


require 'csv'

# Path to your CSV file
csv_file_path = Rails.root.join('db/seeds/Data_Sources.csv')

# Reading the CSV file
CSV.foreach(csv_file_path, headers: true) do |row|

  admin_id = User.admin.first.id
  if row['Source Name'].present?
    puts "Seeding Source Name", row['Source Name']
    unless  Provider.find_by_source_name(row['Source Name']).present?
      Provider.create(source_name: row['Source Name'],
                      logo_link: row['Logo'],
                      website_link: row['Website Address'],
                      data_use_agreement_link: row['Link to Data Use Agreement'],
                      dataset_available: row['Datasets_Available'].to_s.gsub(',', '').to_i,
                      short_site_description: row['Short Site Description'],
                      user_id: admin_id,
                      category_list: row['Category(s)- all that apply'],
                      general_category_list: row['General Category'],
                      sub_category_list: row['Sub Category'],
                      keyword_list: row['Keywords (optional)'],
                      dataset_format_list: row['Formats'],
                      dataset_type_list: row['Type of Datasets'],
                      dataset_geography_list: row['Geography'],
                      time_list: row["Time"],
                      price_list: row['Price']
      )
    end
  end
end
