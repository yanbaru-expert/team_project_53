module ApplicationHelper
  def max_width
    if controller_name == "texts" && action_name == "show"
      "mw-md"
    # Devise 導入後にコメントアウトを解除
    elsif devise_controller?
      "mw-sm"
    else
      "mw-xl"
    end
  end

  def page_title
    if params[:genre] == "php"
      "PHP"
    else
      "Ruby/Rails"
    end
  end
end
