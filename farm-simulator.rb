#require 'pry'
class Thefarm 
	@@farm = []

	def initialize(crop, size)
		@crop = crop 
		@size = size
	end 

	def crop_reader
		crop_list = []
		@@farm.each do |item|
			#if @@farm[@crop] == nil 
				crop_list.push(item)
		end
		return crop_list
	end 

	def crop_size_reader
		return @size
	end 

	def add_to_farm 
		@@farm.push self
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
			return false
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

	def all_fields
		return @@farm
	end 
	def self.harvestable?(crop_name)
		@@farm.each do |crop_type|
			obj = 1
			
			if crop_type.crop_reader == crop_name 
				obj != 1
				return true
			else 
				return false
			end 
				if obj != 1 
					return false 
				end 
		end 
	end

	def harvest(crop_name)
		crop_amount = 0
		if harvestable?(crop_name) == true 
			crop_amount += 5
		else 
			return false
		end 
		return crop_amount

	end 
end 

big_farm = Thefarm.new("big ass farm", "crops")

big_farm = Thefarm.add_field("corn", 5)
big_farm = Thefarm.add_field("wheat", 50)
big_farm = Thefarm.add_field("rice", 500)
big_farm = Thefarm.add_field("stuff", 5000)

puts big_farm.all_fields.inspect
puts 
puts
#search for corn 
puts Thefarm.find_crop("wheat").inspect
#search for crop by field size
puts Thefarm.find_crop_by_size(500).inspect


puts Thefarm.harvestable?("stuff")
puts big_farm.crop_reader.inspect
#puts big_farm.harvest("wheat").inspect