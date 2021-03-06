class Admin::NotificationsController < Admin::ApplicationController
  def index
  	@visitor_notifications = Notification.where(notifiable_type: 'Visitor').order(id: :desc)
  	@comment_notifications = Notification.where(notifiable_type: 'Comment').order(id: :desc)
  end

  def destroy
  	@notifiable = Notification.find(params[:id])
  	@notifiable.destroy

  	redirect_to :back, notice: "Successfully deleted the notification"
  end

  def delete_all
  	Notification.delete_all
  	redirect_to :back, notice: "All notifications were deleted"
  end

end
