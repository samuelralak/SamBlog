require 'faker'
require 'populator'
 
namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
 
    make_posts
  end
end

def make_posts
  user = Admin.first

  100.times do
    user.posts.create!(
      title: Faker::Lorem.sentence(3),
      content: Faker::Lorem.paragraph(120)
    )
  end
end