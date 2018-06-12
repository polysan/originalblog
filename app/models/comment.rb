class Comment < ActiveRecord::Base
belong_to :blog
belong_to :user
end
