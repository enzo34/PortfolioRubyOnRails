module ApplicationHelper
    def login_helper style = ' '
        if current_user.is_a?(GuestUser)
         (link_to "Inscription", new_user_registration_path, class:style) + " " +
         (link_to "Se connecter", new_user_session_path, class:style)
        else
         (link_to "Editer votre profil", edit_user_registration_path, class:style) + " " +
         (link_to "Deconnecter", destroy_user_session_path, method: :delete, class:style)
        end 
    end
    
    def source_helper(layout_name)
        if session[:source] 
            content = "Merci de nous visiter depuis #{session[:source]} bienvenue sur le #{layout_name} de RubyX Dev"
            content_tag(:p, content, class: "source_content")
        end  
    end

    def nav_items
        [
            {
              url: root_path,
              title: 'Accueil'
             },
            {
              url: about_me_path,
              title: 'En savoir +'
             },
            {
                url: contact_path,
                title: 'Nous contacter'
            },
            {
                url: blogs_path,
                title: 'Blog'
            },
            {
                url: portfolios_path,
                title: 'Projects'
            },

        ]
    end

    def nav_helper style, tag_type
        nav_links = ''
        nav_items.each do |item|
            nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
        end
        nav_links.html_safe
    end

    def active? path
        "active" if current_page? path
    end

    def flash_class(level)
        case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
        end
    end
end
