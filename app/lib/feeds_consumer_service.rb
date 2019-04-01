#require 'simple-rss'
require 'open-uri'

class FeedsConsumerService

  URLS = {
    "PROGRAMMING JOBS" => 'https://weworkremotely.com/categories/remote-programming-jobs.rss',
    "COPYWRITING JOBS" => 'https://weworkremotely.com/categories/remote-copywriting-jobs.rss',
    "DESIGN JOBS" => 'https://weworkremotely.com/categories/remote-design-jobs.rss',
    "SALES & MARKETING JOBS" => 'https://weworkremotely.com/categories/sales-and-marketing.rss',
    "BUSINESS & MANAGEMENT JOBS" => 'https://weworkremotely.com/categories/business-and-management.rss',
    "CUSTOMER SUPPORT JOBS" => 'https://weworkremotely.com/categories/remote-customer-support-jobs.rss',
    "PRODUCT JOBS" => 'https://weworkremotely.com/categories/product.rss',
    "DEVOPS & SYSADMIN JOBS" => 'https://weworkremotely.com/categories/remote-devops-sysadmin-jobs.rss',
    "FINANCE & LEGAL JOBS" => 'https://weworkremotely.com/categories/finance-and-legal.rss',
    "ALL OTHER JOBS" => 'https://weworkremotely.com/categories/remote-jobs.rss'
  }

  def self.call
    results = { created: 0, updated: 0 }
    URLS.each do |category, url|
      open(url) do |rss|
        SimpleRSS.
          yield_self do |srss|
            srss.parse(rss)
          end.
          yield_self do |parsed_feed|
            parsed_feed.items.each do |item|
              feed = Feed.find_by(guid: item.guid)
              attribs = {
                category: category,
                media: item.media_content_url,
                title: CGI::unescapeHTML(item.title),
                description: CGI::unescapeHTML(item.description),
                pub_date: item.pubDate,
                guid: item.guid,
                link: item.link
              }
              if feed
                results[:updated] += 1
                feed.update(attribs)
              else
                results[:created] += 1
                Feed.create(attribs)
              end
            end
          end
      end
    end
    results
  end

end
