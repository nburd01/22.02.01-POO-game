class User
    attr_accessor :age, :email
    @@all_users = []
  
    def initialize(email, age)
      @email = email
      @age = age
      @@all_users << self
    end
  
    def self.all
      @@all_users
    end
  
    def self.find_by_email(email)
      @@all_users.each do |user|
  
        if user.email == email
          return user
        end
  
      end
  
      puts "aucun utilisateur n'a cet email"
      return false
    end
  
  end