module ApplicationHelper
    def login_helper
        if current_user.is_a?(User) 
         (link_to "Editer votre profil", edit_user_registration_path) + 
         ("<br />".html_safe) +
         (link_to "Deconnecter", destroy_user_session_path, method: :delete)
        else 
         (link_to "Inscription", new_user_registration_path) + 
         ("<br />".html_safe) +
         (link_to "Se connecter", new_user_session_path)
        end 
    end
    
    def source_helper(layout_name)
        if session[:source] 
            content = "Merci de nous visiter depuis #{session[:source]} bienvenue sur le #{layout_name} de RubyX Dev"
            content_tag(:p, content, class: "source_content")
        end  
    end
end
