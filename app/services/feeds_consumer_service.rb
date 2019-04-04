require 'open-uri'

class FeedsConsumerService

  def self.call
    results = { created: 0, updated: 0 }
    Feed::URLS.each do |category, url|
      open(url) do |rss|
        SimpleRSS
          .yield_self { |srss| srss.parse(rss) }
          .yield_self do |parsed_feed|
            parsed_feed.items.each do |item|
              feed = Feed.find_by(guid: item.guid)
              attribs = {
                category: category,
                media: item.media_content_url,
                title: CGI.unescapeHTML(item.title),
                description: CGI.unescapeHTML(item.description),
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
