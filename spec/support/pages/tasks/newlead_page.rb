class NewLeadPage < AbstractPage
  include PageObject
  include RelatedToPicker

  page_url "https://app.futuresimple.com/leads/new"

  button(:save_lead, :css => ".btn-primary")
  text_field(:last_name, :css => '#lead-last-name')

end
