class SessionsController < ApplicationController
    def new
    end
  
    def create
      @Cliente = Cliente.find_by("telefono = :telefono", { telefono: params[:telefono] })
  
      if @Cliente&.authenticate(params[:contraseña])
        redirect_to list_products_path
      else
        redirect_to new_session_path
      end
    end
  end