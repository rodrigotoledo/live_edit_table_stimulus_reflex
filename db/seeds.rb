10.times.each do
  Todo.create(title: Faker::Lorem.sentence)
end
