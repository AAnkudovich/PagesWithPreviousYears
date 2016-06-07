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

	# go to the page containing all the links
	agent.get("http://www.taxworld.ie/commentary-pages-set-artem/")
	# get all the Commentary links
	# agent.page.links_with(:text => "Commentary").click
	tcaCommentarys = File.new("tca-commentary.html", "w")
	agent.page.links_with(:text => "Commentary").each do |link|
	# loop through the links
		agent.get("http://www.taxworld.ie/commentary-pages-set-artem/")
		link.click
		Page.create!(:title => agent.page.title, :content => agent.page.at(".page-content"), :slug => agent.page.title.parameterize)
		
		tcaCommentarys.puts(agent.page.at(".page-content"))
		
		
	end
	tcaCommentarys.close
end 