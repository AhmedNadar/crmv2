require ("./contact.rb")

class Database
  attr_accessor :first_name, :last_name, :email, :note, :id

  
  @contacts = []
  @id = 1

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1

  end

  def self.contacts
    @contacts
  end

  def self.modify_first_name(first_name, contact_to_be_modified)
    #puts "im in modify email method"
    contacts.each {|x| x.first_name = first_name if x.id == contact_to_be_modified}
  end

  def self.modify_last_name(last_name, contact_to_be_modified)
    
    @contacts.each {|x| x.last_name = last_name if x.id == contact_to_be_modified}
    
  end

  def self.modify_email(email, contact_to_be_modified)
    @contacts.each {|x| x.email = email if x.id == contact_to_be_modified} 
    
  end

  def self.modify_note(note, contact_to_be_modified)
    @contacts.each {|x| x.note = note if x.id == contact_to_be_modified} 
    
  end

  def self.modify_id(new_id, contact_to_be_modified)
    
@contacts.each {|x| x.id = new_id if x.id == contact_to_be_modified}     
  end
  
  def self.display_all_contacts
    @contacts.each do |contact| 
      puts ""
      puts ""
      puts ""
      puts "[id] : #{contact.id}"
      puts "[name] :  #{contact.first_name} #{contact.last_name}" 
      puts "[email] : #{contact.email}"
      puts "[note] : #{contact.note}"
      puts ""
      puts ""
      puts ""
    end  
  end

  def self.display_all_name
    @contacts.each {|contact| puts "[name] :  #{contact.first_name} #{contact.last_name}" } 
  end

  def self.display_all_email
    @contacts.each {|contact| puts "[email] :  #{contact.email}"  } 
  end

  def self.display_all_note
    @contacts.each {|contact| puts "[note] :  #{contact.note}" } 
  end

  def self.display_all_id
    @contacts.each {|contact| puts "[id] :  #{contact.id}" } 
  end

  def self.delete_contact(contact_to_be_deleted)
    @contacts.delete_if { |contact| contact.id == contact_to_be_deleted   }
  end

end