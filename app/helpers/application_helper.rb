module ApplicationHelper
    # fills in search fields with existing params on search submit
    def existing_input(key)
        params.has_key?(key) ? params[key] : nil
    end

    # compares current user to user id in params
    def authorized_user?
        return false unless current_user

        User.find(params[:id]) == current_user
    end
end
