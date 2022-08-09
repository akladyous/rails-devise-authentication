module ApplicationHelper
    def feedback_for?(object)
        return nil if resource.errors.empty?
        if resource.errors.has_key?(object)
            return content_tag :div, nil, { class: ['d-block', 'invalid-feedback'] } do
                resource.errors.full_messages_for(object).to_sentence
            end
        end
        nil
    end
end
