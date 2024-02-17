require 'ffaker'

puts "Seeding Posts..."
if Post.first.nil?
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
end

if User.first.nil?
    User.create(email: "diego@blog.com", password: "password", password_confirmation: "password")
end

puts "Seeding done."