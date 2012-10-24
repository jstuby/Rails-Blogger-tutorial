module ApplicationHelper
  #Creates the sidemenu
  def build_navigation
    month_numbers = Article.all.collect{|a| a[:created_at].month}.uniq
    month_links = '<ul id="side-menu">'
    month_numbers.each do |m|
      month_link = link_to Date::MONTHNAMES[m], articles_path(:type => 'month', :month => m)
      month_links += '<li>' + month_link + '</li>'
    end
    month_links += '<li>' + (link_to "Most Popular", articles_path(:type => 'popular')) + '</li>'
    month_links += '<li>' + (link_to "All Articles", articles_path) + '</li>'
    month_links += '<li>' + (link_to "All Tags", tags_path) + '</li>'
    month_links += '<li>' + (link_to "New User", authors_path) + '</li>'
    month_links += '</ul>'
    
    return month_links.html_safe
  end
end
