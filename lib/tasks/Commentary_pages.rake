desc "Import Commentary Pages"
task :import_commentary => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username="AAnkudovich"
	form.password="1Hello11"
	form.submit

	# go to the page containing all the links
	agent.get("http://www.taxworld.ie/commentary-pages-set-artem/")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	

	agent.page.links_with(:href => /tca-1997/).each do |link|
	# loop through the links
		agent.get("http://www.taxworld.ie/commentary-pages-set-artem/")
		link.click
		Page.create!(:title => agent.page.title, :content => agent.page.at(".page-content"), :template => "Content Page")
		
		
		
		
	end
	end 

	task :import_chapters => :environment do 
	require 'mechanize'

	agent = Mechanize.new

	# login to the system
	agent.get("http://www.taxworld.ie/login/")
	form = agent.page.forms.first
	form.username="AAnkudovich"
	form.password="1Hello11"
	form.submit

	# go to the page containing all the links
	agent.get("http://www.taxworld.ie/tca-linsting-prep/")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	

	agent.page.links_with(:href => /tca-1997/).each do |link|
	# loop through the links
		agent.get("http://www.taxworld.ie/tca-linsting-prep/")
		link.click
		Page.create!(:title => agent.page.title, :slug => agent.page.title.parameterize, :template => "Listing")
		
		
		
		
	end
	
end 