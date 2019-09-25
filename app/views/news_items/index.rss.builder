xml.instruct!
xml.rss(version: "2.0",
        "xmlns:atom" => "http://www.w3.org/2005/Atom") do
  xml.channel do
    xml.title params[:q].present? ? "#{Setting.site_name} Feed für Suche nach #{params[:q]}" : "#{Setting.site_name}: Alle News"
    xml.link search_url(q: params[:q], sort: params[:sort])
    xml.lastBuildDate Time.zone.now
    xml.tag!('atom:link', rel: 'self', type: 'application/rss+xml', href: search_url(q: params[:q], sort: params[:sort]))
    @news_items.each do |ni|
      xml.item do
        xml.title ni.title
        xml.link ni.url
        xml.guid ni.guid
        xml.description do
          xml.cdata! ni.teaser.to_s
        end
      end
    end
  end
end
