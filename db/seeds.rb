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



# *************** add images and tie them to users ***********************

# Arnold Schwarzengger
#   Image.create(url: "http://www.gstatic.com/tv/thumb/persons/1570/1570_v9_bb.jpg", user_id: 10)

# # Hulk Hogan
#   Image.create(url: "http://www.gstatic.com/tv/thumb/persons/27170/27170_v9_ba.jpg", user_id: 9)
  
# # Heidi Powell
#   Image.create(url: "http://www.gstatic.com/tv/thumb/persons/784987/784987_v9_ba.jpg", user_id: 8)
  
# # Jeremy
#   Image.create(url: "https://s3-us-west-1.amazonaws.com/co-directory-images/jeremyalvarez.jpg", user_id: 7)
  
# # Bozo
#   Image.create(url: "https://c1.staticflickr.com/4/3275/2715786898_f396c6b1d0_b.jpg", user_id: 6)

# # Beauregard
#   Image.create(url: "https://gfnc1kn6pi-flywheel.netdna-ssl.com/wp-content/uploads/2016/10/sp3.jpg", user_id: 5)
  
# # Scooby
#   Image.create(url: "https://lh3.googleusercontent.com/m7uqFDVdbyIDgTUxpc6A01MugkUoUk34swM6crDoC03I4eRqma-BhaNi7dmuQukb-nLZYiQMgpwXJM6INg", user_id: 4)
  
# # Bob
#   Image.create(url: "https://ih0.redbubble.net/image.26154218.1357/flat,1000x1000,075,f.u2.jpg", user_id: 3)
  
# # Cassandra
#   Image.create(url: "http://static.wixstatic.com/media/1d2e2d_6826432113bf483397f024eb29b42bea.jpg/v1/fill/w_340,h_293,al_c,q_80,usm_0.66_1.00_0.01/1d2e2d_6826432113bf483397f024eb29b42bea.webp", user_id: 2)

# # Cory
#   Image.create(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfgdq7r1HoNH1XtNV4RfR34nYUe4vwU9a2sZqO69EA7h762qXh", user_id: 1)

# *************** add images and tie them to users ***********************