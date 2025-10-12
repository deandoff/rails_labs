class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def hello
    render plain: "¡Hola, mundo!"
  end

  def goodbye
    render plain: "Goodbye, world!"
  end

end
