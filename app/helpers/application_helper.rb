module ApplicationHelper
  def readable_date(date)
    date.strftime("%d %B %Y")
  end
end
