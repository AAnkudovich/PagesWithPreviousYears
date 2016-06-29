
desc "Import Commentary Pages"
task :import_commentary_tca => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username=""
	form.password=""
	form.submit

	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/TCA.html")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	
	number=0
	agent.page.links_with(:text => "Commentary").each do |link|
	# loop through the links
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/TCA.html")
		link.click
		Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Commentary", :slug => agent.page.title[0..agent.page.title.length-20].parameterize)
		
		number=number+1
		puts "TCA #{number}"
		
		
	end
	end


task :import_commentary_vatca => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username=""
	form.password=""
	form.submit

	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/VATCA2010.html")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	
	number=0
	agent.page.links_with(:text => "Commentary").each do |link|
	# loop through the links
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/VATCA2010.html")
		link.click
		Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Commentary", :slug => agent.page.title[0..agent.page.title.length-20].parameterize)
		
		number=number+1
		puts "VATCA #{number}"
		
		
	end
	end 

	task :import_commentary_catca => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username=""
	form.password=""
	form.submit

	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/CATCA2003.html")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	
	number=0
	agent.page.links_with(:text => "Commentary").each do |link|
	# loop through the links
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/CATCA2003.html")
		link.click
		Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Commentary", :slug => agent.page.title[0..agent.page.title.length-20].parameterize)
		
		number=number+1
		puts "CATCA #{number}"
		
		
	end
	end 

	task :import_commentary_sdca => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username=""
	form.password=""
	form.submit

	# go to the page containing all the links
	agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/SDCA1999.html")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	
	number=0
	agent.page.links_with(:text => "Commentary").each do |link|
	# loop through the links
		agent.get("https://s3-eu-west-1.amazonaws.com/taxworld-ie/SDCA1999.html")
		link.click
		Page.create!(:title => agent.page.title[0..agent.page.title.length-20], :content => agent.page.at(".page-content"), :template => "Commentary", :slug => agent.page.title[0..agent.page.title.length-20].parameterize)
		
		number=number+1
		puts "SDCA #{number}"
		
		
	end
	end 