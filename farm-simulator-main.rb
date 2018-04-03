class Thefarm 
	@@farm = []
	@@harvested = []
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

	def self.harvestable?(crop_name)
		
		obj = 0 
		@@farm.each do |crop|
			 
			if crop.crop_reader == crop_name
				obj = 1
				return true
			end 
		end
		if obj != 1
			return false
		end 
	end 

	def self.does_it_exist?(input) #checks the existance of the crop object in the array of objects with the built in method include?
		if Thefarm.all_fields.include?(input) 
			return true 
		 
		else return false
		
		end 
	end 

	def self.harvest #this method calls on harvestable? to check if the specified crop is available/possible to harvest
		crop_amount = 0
		p "what crop would you like to harvest?"
		crop_name = gets.chomp.to_s
		
		if harvestable?(crop_name) == true 
			crop_amount += 5

		else  
			p "error"
			return false
			 
		end 
		harvester(crop_amount, crop_name)
		
	end 

	def self.harvester(harvest_amount, harvest_name)
		harvested_crops = Thefarm.new(harvest_amount, harvest_name)
		harvested_crops.add_to_harvest

	end 

	def add_to_harvest 
		@@harvested.push(self)
	end 

	def self.all_harvests 
		return @@harvested
	end 


	def add_to_farm 
		@@farm.push self
	end 

	def self.all_fields
		return @@farm
	end 

	def remove_field
		@@farm.delete(self)
	end
end 

big_farm = Thefarm.new("big ass farm", "crops")

big_farm = Thefarm.add_field("corn", 5)
big_farm = Thefarm.add_field("wheat", 50)
big_farm = Thefarm.add_field("rice", 500)
big_farm = Thefarm.add_field("stuff", 5000)

#puts big_farm.inspect
#puts Thefarm.all_fields.inspect
# puts 
# puts
# #search for corn 
# puts 
# puts
#puts Thefarm.find_crop("corn").inspect
# #search for crop by field size
# puts 
# puts
#big_farm.harvest
#puts Thefarm.find_crop_by_size(50).inspect
# puts 
# puts

# puts Thefarm.all_fields.inspect
#puts big_farm.harvest.inspect