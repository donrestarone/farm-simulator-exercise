require_relative 'farm-simulator-main.rb'

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
		puts "[4] remove field"
		puts "[5] search by crop name"
		puts "enter a number"
	end 

	def call_option(user_input)
		case user_input
			when 1 then add_new_field 
			when 2 then harvest_crops
			when 3 then show_farm_status
			when 4 then remove_field_from_farm
			when 5 then search_by_crop_name

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
			puts "----------------------------------------"
			puts "crop type;#{crop_type.crop_reader}"
			puts "crop size;#{crop_type.crop_size_reader}"
			puts "+++++++++++++++++++++++++++++++++++++++++"
		end 
	end 

	def remove_field_from_farm #commented out parts not working 
		p "which field would you like to remove"
		response = gets.chomp
		#if Thefarm.does_it_exist?(response) == true
			field_remove = Thefarm.find_crop(response)
			p "removing #{field_remove} now"
			field_remove.remove_field
		#else 
			#return p "cannot remove"
		#end
	end

	def search_by_crop_name #not working 
		p "which crop would you like to search for?"
		input = gets.chomp
		output = Thefarm.find_crop(input)
		p output
		#return output
	end 

	def harvest_crops
		Thefarm.harvest
	end 

end


menue = Farm_ui.new

puts menue.main_menue