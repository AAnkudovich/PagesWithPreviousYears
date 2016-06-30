desc "Import Commentary Pages"
task :import_commentary => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username=""
	form.password=""
	form.submit
	number=1
	tca = Page.create!(:title => "TCA 1997", :template => "Listing", :slug => "tca-1997", :priority =>number)
	
	# TCA 1997
	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/TCA.html")
	agent.page.links.each do |link|
	# loop through the links
	number=number+1
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/TCA.html")
		link.click
		page = Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Content Page", :priority =>number, :parentPage => tca.id)
		Association.create(:pageID => page.id, :pagename => page.title)	
	end
	number=number+1
	vatca = Page.create!(:title => "VATCA 2010", :template => "Listing", :slug => "vatca-2010", :priority =>number)
	# VATCA 2010
	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/VATCA2010.html")
	agent.page.links.each do |link|
	# loop through the links
	number=number+1
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/VATCA2010.html")
		link.click
		page = Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Content Page", :priority =>number, :parentPage => vatca.id)
		Association.create(:pageID => page.id, :pagename => page.title)	
	end
	number=number+1
	catca = Page.create!(:title => "CATCA 2003", :template => "Listing", :slug => "catca-2003", :priority =>number)
	# CATCA 2003
	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/CATCA2003.html")
	agent.page.links.each do |link|
	# loop through the links
	number=number+1
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/CATCA2003.html")
		link.click
		page = Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Content Page", :priority =>number, :parentPage => catca.id)
		Association.create(:pageID => page.id, :pagename => page.title)	
	end
	number=number+1
	sdca = Page.create!(:title => "SDCA 1999", :template => "Listing", :slug => "sdca-1999", :priority =>number)
	# SDCA 1999
	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/SDCA1999.html")
	agent.page.links.each do |link|
	# loop through the links
	number=number+1
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/SDCA1999.html")
		link.click
		page = Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Content Page", :priority =>number, :parentPage => sdtca.id)
		Association.create(:pageID => page.id, :pagename => page.title)	
	end
	number=number+1
	ca = Page.create!(:title => "Companies Act 2014", :template => "Listing", :slug => "companies-act-2014", :priority =>number)
	# Companies Act 2014
	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/CompaniesAct2014.html")
	agent.page.links.each do |link|
	# loop through the links
	number=number+1
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/CompaniesAct2014.html")
		link.click
		page = Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Content Page", :priority =>number, :parentPage => ca.id)
		Association.create(:pageID => page.id, :pagename => page.title)	
	end
	end 

	