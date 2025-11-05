class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def contact
  end

  def font
    if params[:font_size].present?
      session[:font_size] = params[:font_size]
      redirect_to root_path, notice: "Размер шрифта установлен: #{params[:font_size]}px"
    end
    
    @current_font_size = session[:font_size] || '16'
  end
end
