### Rails 4 Skeleton ###
- postgresql
- thin
- sass
- rspec
- capybara
- shoulda
- factory girl
- database cleaner
- debugger
- rename.rake
  renames the skeleton to your app name. Run rake rename[YOURAPPNAME] and you have a

# Useage #
- clone https://github.com/edshadi/rails4-skeleton.git your_app_name
- cd your_app_name
- bundle
- rake rename[your_app_name]
- mv config/database.example.yml config/database.yml
- rake db:create db:test:prepare
- rails s

