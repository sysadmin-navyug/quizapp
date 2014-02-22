class HangmanController < ApplicationController
	
	def initNow
		$hflag = 0
		$id = 0
		$hang = 0
		$score = 0
		$chances = 5
		$total_questions = 10
		$name = "Mr. Foo"
		$hStatus = [
			" ",
			"The stage is built.",
			"The hang post is up.",
			"The rope is ready.",
			"I have tightened the knot on your neck.",
			"I hang you."]
	end

	def index
		initNow
		@quiz = Quest.all
	end

	def show
		$q = Quest.all
		$quiz = $q[$id]
	end

	def create
		@opt = params[:commit]
		if @opt =~ /#{$quiz.answer}/ix
			$score += 1
		else
			$hang += 1
			if $hang >= $chances # Check hanging possiblity
				$hflag = 1
			end
		end
		$id += 1
		if $id < $total_questions and $hang < $chances #and $hflag == 0 
			$quiz = $q[$id]
			render :action => 'show'
		else
			render :action => 'finished'
		end
	end
	
	def finished
		
	end
	
end
