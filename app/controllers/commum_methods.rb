module CommumMethods
	def filter_by_course(looking_for = :notices)
		args = params[:ids].split(',')
		elements ||= []
		
		args.each do |element|
			finder = Course.find(element.to_i).send(looking_for)
			elements << finder unless elements.include? finder
		end

		respond_to do |format|
			format.json { render json: elements.to_json }
		end
	end
end