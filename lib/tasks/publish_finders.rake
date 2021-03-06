namespace :finders do
  desc "Publish finder pages to the publishing API"
  task publish: :environment do
    puts "Publishing finders"
    PublishFinders.call
  end
end

desc "Publish finder pages to the publishing API (alias)"
task "publishing_api:publish": "finders:publish"
