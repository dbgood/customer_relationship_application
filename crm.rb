
require_relative './rolodex.rb'
require_relative './contact.rb'

class CRM 
	attr_reader :name

	def initialize(name) 
		@name = name
		@rolodex = Rolodex.new
	end

	def add_sample_contacts
		@rolodex.add_contact( Contact.new("Bob", "Jones", "bob@ocp.com", "A good man"))
		@rolodex.add_contact( Contact.new("Other", "Guy", "other@ocp.com", "A bad man"))
	end		

	def print_main_menu
		puts  # Puts a space in the terminal when displaying.
		puts "[1] Add a contact"     
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end

	def main_menu
		puts "Welcome to #{@name}"

		while true
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input)
			return if input == 7
		end
	end

	def choose_option (option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 7
			puts "Goodbye"
			exit
		else
			put "Incorect option, try again."
		end
	end


	def  add_contact
		puts "Provide contact details"

		puts "First name"	
		first_name = gets.chomp

		puts "Last name"
		last_name = gets.chomp

		puts "email"
		email = gets.chomp

		puts "note"
		note = gets.chomp

		contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(contact)
	end

	def display_contacts
		# call method in rolodex to display contacts
		
		@rolodex.contacts.each do |contact|
			puts contact
		end
	end	

	def display_contact
		contact = prompt_for_contact
		puts contact
	end 


	def prompt_for_contact
		puts "Which contact id?"
		num = gets.chomp.to_i

		contact = @rolodex.find(num)

		puts "Found: #{contact}"
		puts "Is this correct? (yes or no)"
		answer = gets.chomp.downcase

		if answer == "yes"
			return contact
		else
			main_menu
		end
	end

	def prompt_for_attribute
		puts "Which field?"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		
		gets.chomp.to_i
	end

	def modify_contact
		contact = prompt_for_contact

		selection = prompt_for_attribute

		puts "Enter the new value:"
		value = gets.chomp

		case selection
		when 1
			contact.first_name = value
		when 2
			contact.last_name = value
		when 3
			contact.email = value
		when 4
			contact.note = value
		end

		puts "Changed contact: #{contact}"
	end

	def display_attribute
		selection = prompt_for_attribute

		@rolodex.contacts.each do |contact|
			case selection
			when 1
				puts contact.first_name
			when 2
				puts contact.last_name
			when 3
				puts contact.email
			when 4
				puts contact.note
			end
		end

	end

end

bitmaker = CRM.new("Bitmaker Labs CRM")                          # ex The actual result
bitmaker.add_sample_contacts
bitmaker.main_menu