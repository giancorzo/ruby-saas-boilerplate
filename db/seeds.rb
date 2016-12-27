# Admin user, for development, in production create one by hand
user = User.find_or_create_by!(email: "user@example.com") do |user|
    user.password = "example"
    user.password_confirmation = "example"
end
puts 'CREATED ADMIN USER: ' << user.email
