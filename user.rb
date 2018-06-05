require 'pry'
require 'json'

# User class
class User

  # users data stored in USERS constant
  USERS = [
    { id: 1, first_name: 'Ashish', last_name: 'Rao', email: 'ashishrao2598@gmail.com' },
    { id: 2, first_name: 'Neil', last_name: 'Armstrong', email: 'neilarmstrong1969@gmail.com' }
  ]

 # Defining all class methods
  class << self

    # class method to find the user data by it's id
    def find(id)
      self.new.find(id)
    end

    # class method to find the first user data
    def first
      self.new.first
    end

    # class method to find all the user data
    def all
      self.new.all
    end
  end

  # find method to find the user based on the id
  def find(id)
    user = find_user_by_id(id)
    objectify_user(user)
  end

 # first method to fetch the first user from the USERS constant
  def first
    objectify_user(USERS.first)
  end

 # all method to fetch all the users from the USERS constant
  def all
    USERS.map{ |user| objectify_user(user) }
  end

# Methods included as private which are accessed only in the program but cannot be accessed by objects.
  private

  # method to find user by id
  def find_user_by_id(id)
    return unless id
    USERS.find{ |user| user[:id]==id }
  end

# method to convert the user json to object
  def objectify_user(user)
    return unless user
    JSON.parse(user.to_json, object_class: OpenStruct)
  end
end

puts User.all
