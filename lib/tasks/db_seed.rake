require 'rake/task'

task 'db:users' => :environment do
  10.times do |i|

    puts User.create(email: "user#{i}@mail.com", password: '12345678', name: "user#{i}")

  end
end

task 'users:sub' => :environment do

  users = User.where("name LIKE 'user%' ")

  users.each do |user|
    category = Category.order('RANDOM()').limit(1).first
    user.category_subscriptions.create(category_id: category.id)
  end


end