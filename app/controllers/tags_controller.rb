class TagsController < ApplicationController
  respond_to :html
  inherit_resources
  actions :delete, :destroy
  def index
    
  end
  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    respond_with(@tag) do |format|
      format.html { render :layout => !request.xhr? }
    end
    #destroy! { :layout => false }
  end
  def create
    # Grab parent that holds tags
    @taggable = params[:taggable_type].constantize.find(params[:taggable_id])
    # Create tag from params
    @tag = Tag.new(params[:tag])
    # Persist, will not persist if tag is not valid
    @taggable.tags << @tag    
    respond_with(@tag) do |format|
      format.html { render :layout => !request.xhr? }
    end
  end    
end
