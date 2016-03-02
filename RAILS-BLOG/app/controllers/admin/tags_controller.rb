class Admin::TagsController < Admin::ApplicationController #added "Admin::"ApplicationController so as to ensure that it is under password protection
  def new
    @tag = Tag.new
    @tags = Tag.all.order(id: :desc)
  end

  def create
    tags_params[:name].split(',').map do |n|
      Tag.new(name: n).save
    end
    redirect_to new_admin_tag_url, notice: 'Tag was successfully created'
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update tags_params #I want to update the tag with currently filled parameters i.e., tags_params
      redirect_to new_admin_tag_url, notice: 'Tag was successfully updated'
    else
      flash[:alert] = 'There was a problem while updating your tag'
      render :edit
    end
  end

  def show
    #@tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to :back, notice: 'Successfully deleted the tag'
  end

  private

  def tags_params
    params.require(:tag).permit(:id, :name)
  end
end
