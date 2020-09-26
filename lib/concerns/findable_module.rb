require 'pry'
module Concerns::Findable 

    def find_by_name(name)
        # if name == "Slowdive"
            # binding.pry 
        self.all.find{|n| n.name == name}
    end

    def find_or_create_by_name(name)
        # if self == Artist && name == "Slowdive"
        #     binding.pry 
        # end
        found = self.find_by_name(name)
        if !found
        found = self.create(name)
      end
       found
    end


end 


