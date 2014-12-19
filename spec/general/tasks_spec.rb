require 'spec_helper'

def get_created_task_from_list content
  on(TasksPage).task_modal_element.when_not_visible
  on(NavigationPage).tasks
  on(TasksPage).get_task content
end

shared_examples "Create task and check it" do |content, remove_date, related, owner|
  it "Open add task form" do
    p related_name if related_name
    on(TasksPage).add_new_task_element.when_visible.click
  end

  it "Enter task content" do
    on(TasksPage).task_content_element.when_visible(10).value = content
  end

  it "Deselect due date", :if => remove_date do
    on(TasksPage).uncheck_due_date_toggle
  end

  it "Choose related entity", :if => related do
    element_selector = WrappedElement.new(@current_page.related_to_element).selector
    on(TasksPage).select_related_to(element_selector, related_name)
  end

  it "Change task owner", :if => owner do
    on(TasksPage).change_task_owner owner
  end

  it "Save task" do
    on(TasksPage).create_task
  end

  it "Check if task is visible on index" do
    task = get_created_task_from_list content
    expect(task[0]).not_to be_nil
    expect(task[0].link_element(:css => ".related-object").when_visible(5).text).to eq(related_name) if related
  end

  it "Check details in edit mode", :if => owner do
    @current_page.edit_task content
    expect(@current_page.task_content).to eq content
    expect(@current_page.displayed_related_to_name_element.when_visible(10).text).to eq(related_name) if related
    expect(@current_page.div_element(:css => ".task-owner").link_element.text).to eq owner
  end

  it "Close fucking modal", :if => owner do
    @current_page.close_modal
  end
end

describe "Tasks" do
  before(:all) do
    login_to_autotest
    visit(TasksPage)
  end

  describe "Add floating task" do
    include_examples "Create task and check it", Faker::Lorem.sentence, true, false do
      let(:related_name) { nil }
      let(:owner) { false }
    end
  end
end
