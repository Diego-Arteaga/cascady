class UbicacionsController < ApplicationController
    
    def index
        @ubicaciones = Ubicacion.all
    end

    def new
        @ubicacion = Ubicacion.new
    end

    def create
        @cliente = Cliente.find(params[:cliente_id])
        @ubicacion = @cliente.ubicacions.create(ubicacion_params)

        if @ubicacion.save
            redirect_to ubicacions_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def edit
    end

    def update
        if @ubicacion.update(ubicacion_params)
            redirect_to @ubicacion
        else
            render :edit
        end
    end

    def destroy
        @ubicacion.destroy
        redirect_to ubicacions_path
    end
    
    private
        def ubicacion_params
            params.require(:ubicacion).permit(:calle, :numero, :cp, :descripcion)
        end
end
