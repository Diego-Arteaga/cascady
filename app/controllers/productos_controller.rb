class ProductosController < ApplicationController
  def index
    @productos = Producto.all
  end

  def show
    @producto = Producto.find(params[:id])
  end

  def new
    @producto = Producto.new
  end

  def create
    # Crea un nuevo objeto Producto con los parámetros recibidos del formulario
    @producto = Producto.new(producto_params)
  
    # Verifica si se ha adjuntado una imagen en los parámetros recibidos
    if params[:producto][:foto].present?
      # Sube la imagen a Cloudinary
      result = Cloudinary::Uploader.upload(params[:producto][:foto])
      
      # Si la carga de la imagen a Cloudinary fue exitosa, asigna la URL de la imagen al atributo foto del Producto
      if result.present? && result['secure_url'].present?
        @producto.foto = result['secure_url']
      else
        # Maneja el caso en el que la carga de la imagen a Cloudinary falló
        flash[:error] = 'Hubo un error al subir la imagen a Cloudinary.'
        render :new, status: :unprocessable_entity
        return
      end
    end
  
    # Intenta guardar el producto en la base de datos
    if @producto.save
      # Redirecciona a la página de índice de productos si se guarda exitosamente
      redirect_to productos_path
    else
      # Renderiza nuevamente el formulario de creación de productos si no se puede guardar el producto
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @producto = Producto.find(params[:id])
  end

  def update
    @producto = Producto.find(params[:id])

    if @producto.update(producto_params)
        redirect_to @producto
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy

    redirect_to productos_path, status: :see_other
  end

  private

  def producto_params
    params.require(:producto).permit(:nombre, :precio, :descripcion, :promocion, :tipo, :foto)
  end
end
