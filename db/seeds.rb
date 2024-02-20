require 'ffaker'

puts "Seeding Posts..."
if Post.first.nil?
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
    Post.create(title: FFaker::Lorem.word, body: FFaker::Lorem.paragraph)
end

puts "Seeding done."