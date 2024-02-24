require 'ffaker'

puts "Seeding Posts..."
if Post.first.nil?
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
end

puts "Seeding User"
if User.first.nil?
    User.create(name: "Diego Dias", email: "diego@blog.com", password: "password")
end

puts "Seeding done."