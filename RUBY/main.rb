require './lib/person'
include Greet

# introduce name: :Jane, age: 22
# study name: :Ben #for using strings more efficiently(saving memory)


# here we are passing a symbol as well as a block
student :world do |s|     #this is the block that 'yield' is yielding
	s.introduce name: :David      #thus to yield something, it's very important to have a block.
	s.study
end

# student {|s| s.introduce}   #one line block

# p 'Danielle'.object_id
# p 'Danielle'.object_id
# p 'Danielle'.object_id
# p 'Danielle'.object_id

# p :Stacy.object_id
# p :Stacy.object_id
# p :Stacy.object_id