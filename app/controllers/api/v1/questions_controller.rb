module Api
  module V1
    class QuestionsController < RootController
      def index
        @user = User.find(params[:user_id])
        @questions = @user.questions
      end
    end
  end
end
