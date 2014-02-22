class AdminController < ApplicationController

	def index
		@quiz = Quest.all
	end
	def new
		@quiz = Quest.new
		@stat = params[:status]
	end
	def create
		@qn = params[:quest][:question]
		@oa = params[:quest][:option_a]
		@ob = params[:quest][:option_b]
		@oc = params[:quest][:option_c]
		@od = params[:quest][:option_d]
		@an = params[:quest][:answer]
		@quiz = Quest.new(:question => @qn,:option_a => @oa,:option_b => @ob,:option_c => @oc,:option_d => @od,:answer => @an)
		if @quiz.save
			redirect_to new_admin_path
		else
			redirect_to hangman_index_path
		end
	end

	def download
		send_file "#{File.dirname(__FILE__)}/../../public/data/quiz.zip",  :x_sendfile=>true, :disposition => 'attachment'
	end

end
