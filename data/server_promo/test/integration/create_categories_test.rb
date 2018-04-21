require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    def setup
        @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)    
    end
    
    test "recuperar o formulario de nova categoria e criar uma nova categoria" do
        sign_in_as(@user, "password")
        get new_category_path
        assert_template 'categories/new'
        assert_difference 'Category.count', 1 do
        post_via_redirect categories_path, category: {name: "sports"}
        end
        assert_template 'categories/index'
        assert_match "sports", response.body
    end
    
    test "Certificar que envio de categoria inválida dê erro" do
        sign_in_as(@user, "password")
        get new_category_path
        assert_template 'categories/new'
        assert_no_difference 'Category.count' do
        post_via_redirect categories_path, category: {name: " "}
        end

    end
    
    
end