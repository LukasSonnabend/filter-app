FeedSource.create url: "http://www.pludoni.de/blog/2/feed", name: "pludoni GmbH Blog", value: 10
FeedSource.create url: "http://blogs.hrhero.com/hrnews/feed/", name: "HR Hero - Human Resources News", value: 5
FeedSource.create url: "http://www.online-recruiting.net/feed/", name: "Online-Recruiting.net - Der internationale E-Recruiting Trends Blog", value: 5
  FeedSource.create url: "http://www.spiegel.de/thema/karriere/index.rss", name: "SPIEGEL ONLINE - UniSPIEGEL - Karriere", value: -20

  FeedSource.create url: "http://www.newcruiting.de/feed/feed", name: "newcruiting - the HR Trend Scouts", value: 5
  FeedSource.create url: "http://blog.kununu.com/feed/", name: "kununu Blog - Der Blog rund um kununu und HR Social Media", value: 3
  FeedSource.create url: "http://berufebilder.de/jobsuche-bewerbung/feed/", name: "B E R U F E B I L D E R - Arbeitsmarkt, Jobsuche & Recruiting", value: 5
  FeedSource.create url: "http://www.talential.com/blog/feed/", name: "Talential-Blog zu Job, Karriere und Recruiting", value: 5


  FeedSource.create url: "http://www.secretsites.de/joblog/feed/", name: "JOBlog - Der Jobbörsen- und Karriere-Blog", value: 3
  FeedSource.create url: "http://crosswater-job-guide.com/feed", name: "Crosswater Job Guide", value: 4
  FeedSource.create url: "http://www.experteer-blog.de/feed/", name: "Experteer Blog - Karrieren für Deutschlands beste Köpfe", value: 5
  FeedSource.create url: "http://blog.recrutainment.de/category/erecruiting/feed", name: "eAssessment, SelfAssessment & Employer Branding Blog - Thema eRecruiting", value: 6
  FeedSource.create url: "http://blog.recrutainment.de/category/fachartikel-eassessment/feed", name: "eAssessment, SelfAssessment & Employer Branding Blog - Thema Fachartikel", value: 6
  FeedSource.create url: "http://www.personalmarketingblog.de/feed", name: "Personalmarketingblog", value: 5
  FeedSource.create url: "http://personalmarketing2null.de/feed", name: "personalmarkting2null", value: 5
  FeedSource.create url: "http://www.der-hr-blog.de/feed/", name: "Der HR Blog", value: 5
  FeedSource.create url: "http://blog.metahr.de/feed/", name: "Human Resource-Blog der metaHR: Personalentwicklung 2.0 – Recruiting – wirksame Führung – effektives Training.", value: 5
  FeedSource.create url: "http://jtsalikis.blogspot.com/feeds/posts/default", name: "Mein Freund die Arbeitgebermarke", value: 5
  FeedSource.create url: "http://www.wuv.de/rss/feed/hrmarketingblog", name: "HRmarketingblog - wuv.de", value: 5

  FeedSource.create url: "http://feeds.feedburner.com/HRExaminer", name: "HR Examiner", value: 5
  FeedSource.create url: "http://feeds.feedburner.com/hrcapitalist", name: "HR Capitalist", value: 5
  FeedSource.create url: "http://feeds.feedburner.com/KnowhrBlog", name: "Know HR", value: 5

  # Karriere Seiten
  #FeedSource.create url: "http://feeds.feedburner.com/karrierebibelblog", name: "karrierebibel.de", value: -5
  Source.where(logo_file_name: nil).reverse.each do |s|
    if s.url == "http://www.secretsites.de/joblog/feed/"
      puts "DEFINE"
      s.define_singleton_method :host, -> { "http://www.secretsites.de/joblog/" }
    end
    s.download_thumb
  end


Category.create! name: 'Recruiting', keywords: 'Stellenanzeigen,Kandidaten,Fachkräftemangel,Jobbörse,Bewerbermanagement,talentpool,headhunter,Karriereseite'
Category.create! name: 'Studie', keywords: 'Survey,studien,studie,umfrage,empirisch'
Category.create! name: 'Employer-Branding', keywords: 'Kununu,employer-branding,arbeitgebermarke,Mitarbeiterbindung,arbeitgeberbewertung,Personalmarketing'
Category.create! name: 'Bewerbung', keywords: 'Lebenslauf,Anschreiben,Bewerbungsgespräch,Karriereplanung,Bewerber'
Category.create! name: 'Personen', keywords: 'Interview,personaler,manager'
Category.create! name: 'Bildung', keywords: 'weiterbildung,hochschule,Universität,ausbildung,mobile learning,online education'
Category.create! name: 'Social-Media', keywords: 'facebook,xing,twitter,linkedin,fanpage'
Category.create! name: 'Karriereplanung', keywords: 'karriereplanung,Karriereleiter,beförderung,chef,degradierung,entlassung,gehaltserhöhung'
Category.create! name: 'Rechtliches', keywords: 'Gerichtsurteil,abmahnung,§,Paragraph,Anwalt,verklagen,gericht'

