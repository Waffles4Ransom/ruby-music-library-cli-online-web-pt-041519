
module Concerns::Findable
  
  def find_by_name(name)
    self.all.find {|obj| obj.name == name}
  end 
  
  def find_or_create_by_name(name)
    object = self.find_by_name(name)
    if object == nil 
      self.create(name)
    else 
      object 
    end 
  end 
  
end 
