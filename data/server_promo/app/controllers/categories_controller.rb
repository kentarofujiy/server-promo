class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
    
    def index
        
        @categories = Category.all.page(params[:page]).per(10)
     @landmark_category = Group.find(9)
        @lankmarks = @landmark_category.pois.all

    end
    
        
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        flash[:notice] = "Categoria apagada com sucesso"
        redirect_to categories_path
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "A categoria foi criada com sucesso"
            redirect_to categories_path
        else
            render 'new'
        end
    end
    
    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:success] = "Categoria atualizada com sucesso"
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end
    
    def show
        @category = Category.find(params[:id])
        @category_projetos = @category.projetos.page(1)
        @category_pois = @category.pois.page(1)
    end

    
end

    private
    def category_params
        params.require(:category).permit(:name)
    end
    def require_admin
        if !logged_in? || (logged_in? and !current_user.admin?)
        flash[:danger] = "Esta ação só pode ser feita pelo administrador"
        redirect_to categories_path
        end
    end
