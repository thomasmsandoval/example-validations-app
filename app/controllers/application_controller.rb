class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unles: -> { request.format.json? }
end
