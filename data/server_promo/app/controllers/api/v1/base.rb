module API  
  module V1
    class Base < Grape::API
      mount API::V1::Projetos
      mount API::V1::Categories
      # mount API::V1::AnotherResource
    end
  end
end  