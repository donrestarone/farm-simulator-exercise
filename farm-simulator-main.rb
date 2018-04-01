# class Thefarm 
# 	@@farm = []
# 	def initialize(farm_name)
# 		@farm_name = farm_name 
# 	end 

# 	def add_field(crop, size)
# 		field = {crop => size}
# 		@@farm.push(field)
# 	end 

# 	def all_fields
# 		return @@farm
# 	end 
# end 

# big_farm = Thefarm.new("big ass farm")

# big_farm.add_field("corn", 5)
# big_farm.add_field("wheat", 50)
# big_farm.add_field("stuff", 500)

# puts big_farm.all_fields.inspect

class Thefarm 
	@@farm = []

	def initialize(crop, size)
		@crop = crop 
		@size = size
	end 

	def crop_reader
		return @crop
	end 

	def crop_size_reader
		return @size
	end 

	def self.add_field(crop, size)
		new_field = Thefarm.new(crop, size)
		new_field.add_to_farm #call on the add to farm instance method to add to the farm array
		return new_field
	end 

	def self.find_crop(crop_name) #method to find by crop name. calls on the crop reader method 
		obj = 0 
		@@farm.each do |crop|
			if crop.crop_reader == crop_name
				obj = 1
				return crop
			end 
		end
		if obj != 1
			return "error"
		end 
	end 

	def self.find_crop_by_size(crop_size) #method to find by crop size. calls on the crop_size_reader method 
		obj = 0 
		@@farm.each do |field_sizes|
			if field_sizes.crop_size_reader == crop_size
				obj = 1
				return field_sizes #returns the name of the crop
			end 
		end
		if obj != 1
			return "error"
		end 
	end 


	def add_to_farm 
		@@farm.push self
	end 

	def self.all_fields
		return @@farm
	end 
end 

big_farm = Thefarm.new("big ass farm", "crops")

big_farm = Thefarm.add_field("corn", 5)
big_farm = Thefarm.add_field("wheat", 50)
big_farm = Thefarm.add_field("rice", 500)
big_farm = Thefarm.add_field("stuff", 5000)

puts Thefarm.all_fields.inspect
puts 
puts
#search for corn 
puts 
puts
puts Thefarm.find_crop("stuffff").inspect
#search for crop by field size
puts 
puts

puts Thefarm.find_crop_by_size(500).inspect
puts 
puts

puts Thefarm.all_fields.inspect