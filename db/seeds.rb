# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)




# ************** gather exercise information and save to database*********
# exercise_urls = []
# index = 1
# while index <= 18
#   web_url = "https://www.bodybuilding.com/exercises/finder/?muscleid=#{index}"
#   puts "url #{web_url}"
#   page = Nokogiri::HTML(open("#{web_url}"))
#   i = 0
#   while i < page.css("h3.ExHeading a").length
#     exercise_urls << page.css("h3.ExHeading a")[i]["href"]
#     i += 1
#   end
#   index += 1
# end
# p exercise_urls.length
# i = 0
# exercise_urls.length.times do
#   exercise_urls[i] = "https://www.bodybuilding.com" + exercise_urls[i]
#   i += 1
# end
# counter = 1
# exercise_urls.each do |exercise_url|
#   web_url = exercise_url
#   page = Nokogiri::HTML(open("#{web_url}"))
#   new_title = page.css('title').text.split(" |")[0]
#   new_exercise_type = page.css("ul.bb-list--plain a")[0].text.strip
#   new_target_muscle = page.css("ul.bb-list--plain a")[1].text.strip
#   new_required_equipment = page.css("ul.bb-list--plain a")[2].text.strip
#   new_difficulty_level = page.css("ul.bb-list--plain li")[3].text.strip.split("\n")[1].strip
#   exercise = Exercise.new(
#       title: new_title,
#       exercise_type: new_exercise_type,
#       target_muscle: new_target_muscle,
#       required_equipment: new_required_equipment,
#       difficulty_level: new_difficulty_level
#     )
#   if exercise.save
#     puts "creating exercise #{new_title} count is now #{counter}"
#   end

#   i = 0
#   while i < 3
#     image = Image.new(
#       url: page.css("img.ExImg")[i]["src"],
#       exercise_id: Exercise.last.id
#     )
#     if image.save
#       puts "saving image #{i} for #{new_title}"
#     end
#     i += 1
#   end

#   i = 0
#   while i < page.css('li.ExDetail-descriptionStep').length
#     instruction = Instruction.new(
#       direction: page.css('li.ExDetail-descriptionStep')[i].text,
#       exercise_id: Exercise.last.id
#     )
#     if instruction.save
#       puts "saving instruction #{i} for #{new_title}"
#     end
#     i += 1
#   end
#   counter += 1
# end
# ************** gather exercise information and save to database*********