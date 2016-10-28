# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#add players to the database


Dir.foreach(Rails.root + "app/assets/text") do |files|
	next if files == '.' or files == '..'
	name = "default"
	element = files
	star = 1

	File.open(Rails.root + "app/assets/text/" + files, 'r') do |file| 
       file.each do |line|
            if (line.chomp.length == 1)
				star = Integer(line)
			else 
				name = line
				Player.create( name: name, file: (name + ".png").gsub(/\s+/, ""), element: element, star: star)
			end
		end
     end
  end