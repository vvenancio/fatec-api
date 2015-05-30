module CommumMethods
  def filter_by_course(looking_for = :notices)
    args = params[:ids].split(',')
    elements ||= []
    
    args.each do |element|
      if looking_for.eql? :internships
        finder = Course.find(element.to_i).send(looking_for).includes(:enterprise)
      else
        finder = Course.find(element.to_i).send(looking_for)
      end
      elements << finder unless elements.include? finder
    end

    respond_to do |format|
      format.json do
        if looking_for.eql? :internships
          render json: elements.to_json(include: :enterprise)
        else
          render json: elements
        end
      end
    end
  end
end