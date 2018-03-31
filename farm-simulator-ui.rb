require_relative 'farm-simulator.rb'

class Farm_ui
	def initialize 
	end 

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
	end 

	def call_option(user_input)
		case user_input
		when 1 then add_new_field 
		when 2 then harvest_crops
		when 3 then show_farm_status
		when 4 then raise "quit"

		end
	end
end

menue = Farm_ui.new

puts menue.show_main