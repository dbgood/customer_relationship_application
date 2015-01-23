
Class CRM 
    def initialize(name) 
    @name = name            # The instance

    end                               

def main_menu

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
	print_main_menu
	input = gets.chomp.to_i # => 4
	choose_option (input)

end

def choose_option (option)
	case option
	when 1 then add_contact
	when 2 then modify_contacts
	when 3 then display_contacts
	when 4 then display_contact
	when 5 then display_attribute
	when 7
		puts "Goodbye"
		return
	else
		put "Incorect option, try again."

		end
	end
end

bitmaker = CRM.new("Bitmaker Labs CRM")                          # ex The actual result
bitmaker.main_menu

main_menu