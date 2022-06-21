namespace :crawler do
  desc "Crawler watches API"
  task watches: :environment do
    WatchCrawler.call
  end
end
