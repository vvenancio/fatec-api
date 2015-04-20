module CommumMethods
	def filter_by_course(args, looking_for='notices')
		elements ||= []	
		
		args.each do |element|
			
			finder = Course.find(element.to_i).notices unless looking_for.eql? 'internships'
			finder = Course.find(element.to_i).internships unless looking_for.eql? 'notices'
			
			unless elements.include? finder
				elements << finder
			end
		end

		respond_to do |format|
			format.json { render json: elements.to_json }
		end
	end
end