module ArticlesHelper
  def tag_links(tags)
    links = tags.collect{|tag| link_to tag.name, tag_path(tag)}
    return links.join(", ").html_safe
  end

  def tag_list(tags)
    link_list = '<ul>'
    tags.each do |tag|
      link = link_to tag.name, tag_path(tag)
      delete_link = link_to '[X]', tag_path(tag), :method => :delete, :confirm => "You sure you want to delete [#{tag.name}] from tag list?", :class => 'delete-tag'
      link_list += '<li>' + link + ' ' + delete_link + '</li>'
    end
    link_list += '</ul>'

    return link_list.html_safe
  end
end
