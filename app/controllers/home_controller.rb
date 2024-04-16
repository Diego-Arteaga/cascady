class HomeController < ApplicationController
  # http_basic_authenticate_with name: "cascady", password: "contraseña", except: [:index]

  def index
    @url_logo = url_for(Recurso.find_by(title: "Logotipo").imagen)
    @url_burger = url_for(Recurso.find_by(title: "Hamburguesas").imagen)
    @url_pizza = url_for(Recurso.find_by(title: "Pizzeria").imagen)
    @url_sushi = url_for(Recurso.find_by(title: "Sushi").imagen)
    @url_alitas = url_for(Recurso.find_by(title: "Alitas").imagen)
  end
  
  def list_products
    @productos = Producto.all
    @recurso = Recurso.find_by(title: "Logotipo")
    @url_logo = url_for(@recurso.imagen)
  end

  def registro
    @cliente = Cliente.new
    @url_new = url_for(Recurso.find_by(title: "Registro").imagen)
    @url_logo = url_for(Recurso.find_by(title: "Logotipo").imagen)
  end

  def create_registro
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
        redirect_to login_path
    else
        render :registro, status: :unprocessable_entity
    end
  end

  def pre_login
    @url_logo = url_for(Recurso.find_by(title: "Logotipo").imagen)
    @url_prelogin = url_for(Recurso.find_by(title: "Pre_registro").imagen)
    @url_google = url_for(Recurso.find_by(title: "Google").imagen)
  end

  def product_modal
  end

  def orden
  end

  def cliente_params
    params.require(:cliente).permit(:nombre, :telefono, :contraseña, :condiciones)
  end

end
