namespace :app do
  namespace :rss do
    desc "Downloads parses and saves jobs from weworkremotely.com to feeds table"
    task consume: :environment do
      puts FeedsConsumerService.call.to_json
    end
  end
end
