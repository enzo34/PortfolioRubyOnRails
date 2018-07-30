class ApplicationController < ActionController::Base
    protect_from_forgery
    include DeviseWhitelist
    include SetSource
    include CurrentUserConcern
    include DefaultPageContent
    include CopyrightConcern
    before_action :set_copyright
    end