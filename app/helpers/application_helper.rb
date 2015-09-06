module ApplicationHelper
  def errors_for(resource)
    if resource.errors.full_messages.any?
      render 'shared/error_message', messages: resource.errors.full_messages
    end
  end
end
