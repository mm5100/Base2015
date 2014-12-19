# To run tests you need:

1. Ruby in version 2.1.*
2. For Firefox an installed Firefox Browser
3. For Chrome you have to download 'chromedriver' from:
[http://chromedriver.storage.googleapis.com/index.html](http://chromedriver.storage.googleapis.com/index.html)
and put it on your PATH 
4. Clone repo, run "bundle" and you are ready to go. 

# Usage

1. Provide your credentials in 'config/settings.yml' file
2. Run tests with rspec, e.g: 'BROWSER=firefox rspec spec/general/tasks_spec.rb'

# Development
We use [http://rspec.info/](RSpec) as our test runner, [https://github.com/cheezy/page-object](cheezy/page-object) as our Page-Object Pattern implementation

## Debugging in pry
You can use pry to stop test execution. Just add "binding.pry" in code where you need it. 
Type 'exit' to continue or 'exit!' to stop the test.
