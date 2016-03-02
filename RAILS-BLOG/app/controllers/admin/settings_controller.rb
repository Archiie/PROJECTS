class Admin::SettingsController < Admin::ApplicationController
  def new
  	if Setting.any?
  		redirect_to edit_admin_setting_url(Setting.first)
  	else
  		@setting = Setting.new
  	end
  end

  def create
  	@setting = Setting.new(settings_params)
  	if @setting.save
  		redirect_to edit_admin_setting_url(@setting), notice: "Successfully created setting"
  	else
  		flash[:alert] = "There was a problem while creating setting"
  		render :new
  	end
  end

  def edit
  	@setting = Setting.find(params[:id])
  end

  def update
  	@setting = Setting.find(params[:id])
  	if @setting.update(settings_params)
  		redirect_to edit_admin_setting_url(@setting), notice: "Successfully updated setting"
  	else
  		flash[:alert] = "There was a problem while updating setting"
  		render :edit
  	end
  end

  private

  def settings_params #strong parameters
  	params.require(:setting).permit(:id, :site_name, :post_per_page, :under_maintenance, :prevent_commenting, :tag_visibility) #this is needed when we send th form parameters from view to controller
  end

end
