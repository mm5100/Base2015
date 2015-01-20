class LeadDetailPage < AbstractPage
  include PageObject
  include RelatedToPicker

  text_field(:note_content, :css => "textarea.span12")
  button(:save_note, :css => ".btn.btn-inverse.hide")
  div(:note_body, :xpath => "//p[@class='activity-content note-content']/div")
  
end

