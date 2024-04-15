class RecursosController < ApplicationController
    def index
        @recursos = Recurso.all
      end
    
      def show
        @recurso = Recurso.find(params[:id])
      end
    
      def new
        @recurso = Recurso.new
      end
    
      def create
        @recurso = Recurso.new(recurso_params)
    
        if @recurso.save
          redirect_to recursos_path
        else
            render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @recurso = Recurso.find(params[:id])
      end
    
      def update
        @recurso = Recurso.find(params[:id])
    
        if @recurso.update(recurso_params)
            redirect_to @recurso
        else
            render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @recurso = Recurso.find(params[:id])
        @recurso.destroy
    
        redirect_to recursos_path, status: :see_other
      end
    
      private
    
      def recurso_params
        params.require(:recurso).permit(:title, :imagen)
      end
end
