class ProjetosController < ApplicationController
    before_action :set_projeto, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        
        @projetos = Projeto.page(1)
    end
  
   def new
       @projeto = Projeto.new
    end
    
   def create
       @projeto = Projeto.new(projeto_params)
       @projeto.user = current_user
       if @projeto.save
           flash[:notice] = "Projeto cadastrado com sucesso"
            redirect_to projeto_path(@projeto)
        else
            render 'new'
        end
    end
    
    def show
       
    end
    
    def edit
        
    end
    
    def update
      @projeto.user = current_user
        if @projeto.update(projeto_params)
            flash[:notice] = "Dados atualizados com sucesso"
            redirect_to projeto_path(@projeto)
        else
            render 'edit'
        end
    end
    
    def destroy
        @projeto.destroy
        flash[:notice] = "Projeto apagado com sucesso"
        redirect_to projetos_path
    end
    
    private 
    def set_projeto
        @projeto = Projeto.find(params[:id])
    end
    def projeto_params
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email, category_ids:[], artifact_ids:[] )
    end
    def set_user
      @user = User.find(params[:user_id])
    end
    def require_same_user
        if current_user != @projeto.user and !current_user.admin?
            flash[:danger] = "Vecê não tem permissão"
            redirect_to root_path
        end
    end
end 