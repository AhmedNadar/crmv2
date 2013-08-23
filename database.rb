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

  def self.modify_first_name(first_name)
    #puts "im in modify email method"
    @contacts.each {|x| x.first_name = first_name}
    #p first_name
  end

  def self.modify_last_name(last_name)
    
    @contacts.each {|x| x.last_name = last_name}
    
  end

  def self.modify_email(email)
    @contacts.each {|x| x.email = email} 
    
  end

  def self.modify_email(note)
    @contacts.each {|x| x.note = note} 
    
  end

  #def self.modify_last_name(id)
    
   # @contacts.select{ |id| id == contacts.id}.each {|x| x.id = id} 
    
  #end
  
  def self.display_all_contacts
    @contacts.each do |contact| 
      puts "[ID] #{contact.id}"
      puts "[NAME] #{contact.first_name} #{contact.last_name}" 
      puts "[EMAIL] #{contact.email}"
      puts "[NOTE] '#{contact.note}'"
    end  
  end

end