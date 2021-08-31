class CreateTest < Actionable::Action

    step :notify
    
    def notify
      puts "hi this is put" 
      
    end
   end