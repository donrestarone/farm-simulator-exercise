require_relative 'farm-simulator.rb'

class Farm_ui
	def main_menue
		while true 
			show_main
			user_input = gets.chomp.to_i 
			call_option(user_input)
		end
	end 

	def show_main 
		puts "[1] add a new field" 
		puts "[2] harvest crops"
		puts "[3] show farm status"
		puts "[4] exit program"
		puts "enter a number"
	end 

	def call_option(user_input)
		case user_input
			when 1 then add_new_field 
			when 2 then harvest_crops
			when 3 then show_farm_status
		#when 4 then raise "quit"

		end
	end

	def add_new_field 
		p "what crop would you like to sow"
		crop_type = gets.chomp
		p "how large is the field?"
		field_size = gets.chomp
		Thefarm.add_field(crop_type, field_size)
	end 

	def show_farm_status
		Thefarm.all_fields.each do |crop_type|
			puts "#{crop_type.crop_reader}"
			puts "#{crop_type.crop_size_reader}"
		end 
	end 

end

menue = Farm_ui.new

puts menue.main_menue