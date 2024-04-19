class HomeController < ApplicationController
  # http_basic_authenticate_with name: "cascady", password: "contraseña", except: [:index]

  def index
  end
  
  def list_products

    if params[:categoria].present?
      @productos = Producto.where(tipo: params[:categoria]).with_attached_foto
    else
      @productos = Producto.all.with_attached_foto
    end

    @in = Producto.where(id: 9)
  end

  def registro
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
  end

  def carousel
  end

  def cliente_params
    params.require(:cliente).permit(:nombre, :telefono, :contraseña, :condiciones)
  end
end
