require 'spec_helper'

def get_new_lead_form
  on(NavigationPage).leads
end

lastname = "Holmes"
note = "It is wise to save your notes."
  

shared_examples "Create a note and check it" do
  it "Step 1: Enters lastname on the 'new lead page' form" do
    on(NewLeadPage).last_name_element.when_visible.send_keys lastname
  end

  it "Step 2: Clicks save button" do
    on(NewLeadPage).save_lead_element.when_visible(10).click
  end

  it "Step 3: Enters content of the note to the 'lead detail page' text field" do
    on(LeadDetailPage).note_content_element.when_visible(10).set note 
  end

  it "Step 4: Clicks 'save note' button" do
    on(LeadDetailPage).save_note_element.when_visible(10).click
  end

  it "Step 5: Checks if note content entered in 'Step 3' is present on 'activity' list" do
    on(LeadDetailPage).note_body_element.when_visible(10).text.should eql note
  end
end

describe "Leads" do
  before(:all) do
    login_to_autotest
    visit(NewLeadPage)
end

  describe "Add new lead and create a note" do
    include_examples "Create a note and check it" do
    end
  end
end

