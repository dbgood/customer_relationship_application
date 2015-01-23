class Rolodex 
	attr_reader :contacts          # Rolodex is to store and display
	
	@@ids = 1001

	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@ids
		@contacts << contact
		@@ids +=1
	end

	def find(id)
		@contacts.find { |c| c.id == id }
	end
	# def print_contacts
	# 	@contacts.each do | contact |
	# 	#each
	# 	#iterate over @contacts array
	# 	#print out each contact
	# end
end