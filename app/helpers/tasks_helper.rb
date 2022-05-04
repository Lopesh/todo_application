module TasksHelper
  def add_navigation_tabs(tab_name, is_active)
    content_tag(:li, class: "nav-item", role: "presentation") do
       button_class = is_active ? "nav-link active" : "nav-link " 
       button_tag(tab_name.titleize, class: button_class, id: "#{tab_name}-tab", data: {"bs-toggle": "tab", "bs-target": "##{tab_name}"}, type: "button", role: "tab", "aria-controls": "settings", "aria-selected": "false")
    end
  end

  def add_navigation_tab_contents(id, is_active)
    content_tag(:div, id: id, class: is_active ? "tab-pane active" : "tab-pane",  role: "tabpanel", "aria-labelledby": "home-tab") do
       render 'cards', locals: {tasks: Task.send(id).order(updated_at: :desc)}
    end
  end 
end
