require 'ffaker'

puts "Seeding User"
if User.first.nil?
    User.create(name: "Diego Dias", email: "diego@blog.com", password: "password")
end
puts "Finish users."

puts "Seeding Posts..."
if Post.first.nil?
    5.times do
        Post.create( title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph, user_id: User::first.id )
    end
end
puts "Finish Posts."

puts "Seeding done."