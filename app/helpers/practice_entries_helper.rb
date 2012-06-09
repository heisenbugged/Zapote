module PracticeEntriesHelper
  def hours_from_entries(entries)
    total_hours = 0
    entries.each do |p|
      total_hours += BigDecimal.new(p.hours)
    end
    total_hours
   end
  
end
