class CommentsMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def post_comment
    @comment = params[:comment]
    @user = @comment.item.user
    mail to: @user.email, subject: "comment/question received"
  end

end
