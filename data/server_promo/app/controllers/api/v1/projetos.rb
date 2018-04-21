module API  
  module V1
    class Projetos < Grape::API
      include API::V1::Defaults

      resource :projetos do
        desc "Return all projetos"
        get "", root: :projetos do
          Projeto.all
        end

        desc "Return a projeto"
        params do
          requires :id, type: String, desc: "ID of the 
            projeto"
        end
        get ":id", root: "projeto" do
          Projeto.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end  