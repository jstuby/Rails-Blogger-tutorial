class Comment < ActiveRecord::Base
  # allow for mass assignment
  attr_accessible :author_name, :body

  belongs_to :article
end
