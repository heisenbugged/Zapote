class MultipleChoiceQuestion < Question  
  embeds_many :choices, :as => :answerable
  def type
    "Multiple Choice"
  end
  #returns true if there is more than one correct response
  def multiple_response?
    correct=0
    choices.map { |choice| correct+=1 if choice.correct }          
    correct > 1
  end
  def choices=(choices,hash=nil)
    persisted = self.persisted?
    choices.each do |attributes|
      if attributes[:id].blank?
        self.choices.build(attributes)
      else
        choice = self.choices.detect {
            |c| c.id.to_s == attributes[:id].to_s
        }
        choice.attributes = attributes
      end
    end
  end  
end
