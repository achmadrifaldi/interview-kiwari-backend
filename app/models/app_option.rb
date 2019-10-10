class AppOption < ApplicationRecord
	def	self.to_map
		options = {}

		all.each do |app_option|
			options[app_option.option_name] = app_option.option_value
		end

		return options
	end
end
