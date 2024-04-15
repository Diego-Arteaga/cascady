class SessionsController < ApplicationController
    def new
        @recurso = Recurso.find_by(title: "Login")
        @url_login = url_for(@recurso.imagen)
        @recurso = Recurso.find_by(title: "Logotipo")
        @url_logo = url_for(@recurso.imagen)
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