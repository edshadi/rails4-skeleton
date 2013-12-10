desc "Renaming Rails App"
task :rename, [:message] => :environment  do |t, args|
  file_names = %w{config/application.rb
                  config/environment.rb
                  config.ru
                  Rakefile
                  config/routes.rb
                  config/environments/development.rb
                  config/environments/production.rb
                  config/environments/test.rb
                  config/initializers/secret_token.rb
                  config/initializers/session_store.rb
                  app/views/layouts/application.html.erb
                  config/database.example.yml}
  file_names.each do |file|
    text = File.read(file)
    replace = ''
    case file
    when 'config/database.example.yml'
      db_name = args.message.downcase.gsub(' ', '_').gsub('-','_')
      replace = text.gsub(/\S+_dev/, "#{db_name}_dev").gsub(/\S+_test/, "#{db_name}_test")
    when 'config/initializers/session_store.rb'
      replace = text.gsub(/\w+_session/, "_#{args.message.downcase.gsub(' ', '_').gsub('-','_')}_session").gsub(/#{Rails.application.class.parent}/,  args.message.titleize.gsub(' ', '').gsub('-',''))
    else
      replace = text.gsub /#{Rails.application.class.parent}/, args.message.titleize.gsub(' ', '').gsub('-','')
    end
    File.open(file, "w") {|file| file.puts replace}
  end
end
