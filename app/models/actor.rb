require 'pry'
class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  #An actor has many characters and has many shows through characters.
  def full_name
    #binding.pry
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    # self.characters.collect {|x| x.name}
    # => ["Khaleesi"]
    self.characters.collect {|x| "#{x.name} - #{shows.find(x.show_id).name}"}
  end

end
