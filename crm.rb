require ("./contact.rb")
require ("./database.rb")

class CRM

  def initialize(name)
    @name = name
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    puts "Enter a number: "
  end

  def main_menu
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
  end

 def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_contact if user_selected == 3
    display_all_contacts if user_selected == 4
    display_attribute if user_selected == 5
    exit if user_selected == 6
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp
    print "Enter Last Name: "
    last_name = gets.chomp
    print "Enter Email Address: "
    email = gets.chomp
    print "Enter a Note: "
    note = gets.chomp
    contact = Contact.new(first_name, last_name, email, note)
    Database.add_contact(contact)
    p Database.contacts

    main_menu
    
  end

  def modify_existing_contact
    puts "enter id of contact to be modified" 
    contact_to_be_modified = gets.chomp.to_i
    if contact_to_be_modified == "" 
      puts "\e[H\e[2J" 
      puts "back to main menu"   
      main_menu 
    else 
      puts "confirm selection? (y or n)"
      selection = gets.chomp.downcase #<--- need to be implemented
    end

    if selection == "y"
      puts "What do you want to change" 
      puts "[1] first name" 
      puts "[2] last name" 
      puts "[3] email"
      puts "[4] note" 
      puts "[5] id" 
      attribute_to_be_modified = gets.chomp
    else
      puts "\e[H\e[2J" 
      puts "back to main menu"   
      main_menu 
    end

    case attribute_to_be_modified
      when "1" then 
                    puts "input new first_name"
                    first_name = gets.chomp
                    Database.modify_first_name(first_name, contact_to_be_modified) 
                    main_menu
      when "2" then
                    puts "input new last_name"
                    last_name = gets.chomp
                    Database.modify_last_name(last_name,contact_to_be_modified) 
                    main_menu
      when "3" then
                    puts "input new email"
                    email = gets.chomp
                    Database.modify_email(email, contact_to_be_modified) 
                    main_menu
      when "4" then
                   puts "input new note"
                    note = gets.chomp
                    Database.modify_note(note,contact_to_be_modified) 
                    main_menu 

      when "5" then
                    puts "input new id"
                    new_id = gets.chomp
                    Database.modify_id(new_id, contact_to_be_modified) 
                    main_menu
      else puts "\e[H\e[2J" 
           puts "back to main menu"   
           main_menu 
    end
  
  end

  def delete_contact 
    
  end

  def display_all_contacts
    all_contacts = Database.display_all_contacts
    all_contacts
    main_menu
  end

  def display_attribute
    puts "What do you want to change" 
    puts "[1] Name" 
    puts "[2] email" 
    puts "[3] note"
    puts "[4] id" 
    
    attribute_to_be_displayed = gets.chomp
    case attribute_to_be_displayed
    when "1" then
                  all_name = Database.display_all_name
                  all_name
                  main_menu
    else main_menu

    end
      
    
  end

  def exit
    puts "You are now exiting the program"
    abort
  end
end

a_crm_app = CRM.new("crm")
a_crm_app.main_menu