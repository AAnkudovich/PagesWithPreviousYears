class InformationController < ApplicationController
	def home

    end
    def most_viewed_pages
    	@pages = Page.all.sort_by{|post| post.impressions.count}.last 10
    end
end
