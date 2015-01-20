class LeadsPage < AbstractPage
  include PageObject
  include RelatedToPicker

  page_url "https://app.futuresimple.com/leads"

  div(:lead_name, :css => ".lead-left.clickable>h3")
 
end
