class Article < ActiveRecord::Base
  attr_accessible :title, :body, :tag_list, :image, :author_id
  belongs_to :author
  has_many :comments
  has_many :taggings
  has_many :tags, :through => :taggings
  has_many :attachments
  
  def tag_list
    return self.tags.join(", ")
  end

  def tag_list=(tags_string)
    self.taggings.destroy_all

    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq

    tag_names.each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name)
      tagging = self.taggings.new
      tagging.tag_id = tag.id
    end
  end

  def image=(attrib)
      attachments.build :image => attrib
  end

  def increment_view
    Article.increment_counter(:view_count, self.id)
    return Article.find(self.id).view_count
  end


end
