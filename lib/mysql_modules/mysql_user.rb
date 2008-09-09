module MySqlUser
  
  module ClassMethods
    
    def authenticate(login, password)
      unless  u = self.find_by_login(login) 
        return nil
      else
        puts "#{u.crypted_password} | #{encrypt(password, u.salt)}"
        u && (u.crypted_password == encrypt(password, u.salt)) ? u : nil
      end
    end

    def encrypt(password, salt)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end
  end
  
  module InstanceMethods
    def set_password(password)
      return if password.blank?
      salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{self.key}--")
      self.salt = salt
      self.crypted_password = self.class.encrypt(password, salt)
    end
  end
  
end