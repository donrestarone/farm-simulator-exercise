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

	def self.add_field(crop, size)
		new_field = Thefarm.new(crop, size)
		new_field.add_to_farm #call on the add to farm instance method to add to the farm array
		return new_field
	end 

	def add_to_farm 
		@@farm.push self
	end 

	def all_fields
		return @@farm
	end 
end 

big_farm = Thefarm.new("big ass farm", "crops")

big_farm = Thefarm.add_field("corn", 5)
big_farm = Thefarm.add_field("wheat", 50)
big_farm = Thefarm.add_field("rice", 500)
big_farm = Thefarm.add_field("stuff", 5000)

puts big_farm.all_fields.inspect