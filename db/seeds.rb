require 'ffaker'

puts "Seeding User"
if User.first.nil?
    User.create(name: "Diego Dias", email: "diego@blog.com", password: "password")
end

puts "Seeding Posts..."
if Post.first.nil?
    Post.create( title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph, user_id: User::first.id )
    Post.create( title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph, user_id: User::first.id )
    Post.create( title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph, user_id: User::first.id )
    Post.create( title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph, user_id: User::first.id )
    Post.create( title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph, user_id: User::first.id )
end

puts "Seeding done."