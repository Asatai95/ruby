class ApplicationController < ActionController::Base

  before_action :set_current_user

    #嫌なことはメゾットデリートしよう！！（jqを読み込まないとメゾットデリートが使えないです！！！）
    def destroy
        if @article.destroy
          redirect_to root_path, notice: '削除に成功しました'
        else
          redirect_to root_path, alert: '削除に失敗しました'
        end
      end

    def set_current_user
        @current_user = User.find_by(id: session[:_blog_session])
      end
    

    
      # protected
      # def authenticate_user!
      #   if user_signed_in?
      #     super
      #   else
      #     redirect_to login_path, :notice => ':sign_up'
      #     ## if you want render 404 page
      #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      #   end
      # end
      
end
