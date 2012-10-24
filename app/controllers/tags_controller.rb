class TagsController < ApplicationController
  before_filter :require_login, :only=> [:destroy]

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    tag_id = params[:id]
    
    if tag_id == 'all'
      tags = Tag.all
      tags.each do |tag|
        tag.destroy
      end

      flash[:message] = "All Tags Deleted!"
    else
      tag = Tag.find(tag_id)
      tag.destroy
    
      flash[:message] = "Tag #{tag} Deleted!"
    end
   
    redirect_to tags_path
  end
end
