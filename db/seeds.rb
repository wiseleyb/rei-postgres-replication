# frozen_string_literal: true

sql = %(
  truncate table users;
  truncate table interests;
  truncate table user_interests_non_rails;
)
puts 'Truncating users, interests, user_interests_non_rails'
ActiveRecord::Base.connection.execute(sql)

%w(Olivia
Ethan
Emma
Liam
Ava
Noah
Sophia
Jackson
Isabella
Lucas).each do |name|
  puts "Creating user: #{name}"
  User.where(name: name).first_or_create
end

%w(Astronomy
Biology
Chemistry
Physics
Geology
Ecology
Genetics
Zoology
Botany
Paleontology).each do |interest|
  puts "Create interest: #{interest}"
  Interest.where(name: interest).first_or_create
end

User.all.each do |user|
  Interest.all.shuffle.first(2).each do |interest|
    puts "Associating #{user.name} with #{interest.name}"
    UserInterestsNonRail.where(user_id: user.id, interest_id: interest.id)
                        .first_or_create
  end
end
