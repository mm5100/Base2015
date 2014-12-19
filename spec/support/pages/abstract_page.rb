class AbstractPage
  include PageObject
  include Automatix::PageObjectConfig
  include Automatix::Helper::Web

  def initialize_page
    begin
      wait_until do
        not self.div_element(:css => ".logo-loader-small").visible?
      end
    rescue Watir::Wait::TimeoutError, Timeout::Error
      # it is better to have page fully loaded but
      # in most cases we can ignore spinner its still visible after time
    end
  end
end
