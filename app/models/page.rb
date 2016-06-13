class Page < ApplicationRecord
is_impressionable
  def to_param
  	"#{slug}"
  end
	
end
