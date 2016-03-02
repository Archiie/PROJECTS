module Greet
	def introduce name: 'Kingsley', age: 30
		p "My name is #{name} and I am #{age} years old."
	end

	def study name: :Archi
		p "#{name} studies Ruby"
	end

	def student param
		p "Hello #{param}!"
		yield self    #yield remembers itself(the methods), therefore we can use introduce method
	end
end