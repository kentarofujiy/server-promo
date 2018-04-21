Home
    1. Estabelecimento
        POI
    2. Roteiro
    3. Coleção













N#### Index
[Criando a homepage] (#CRIANDO-A-HOMEPAGE )

# CRIANDO A HOMEPAGE
## Criar a rota
- Navegar para config > routes.rb
'
Rails.application.routes.draw do
  get 'welcome/home', to: 'welcome#home'
end
'
## Criar o controller
- Navegar para app > controllers 
- Criar novo arquivo: inicio_controller.rb
    - Criar classe InicioController como sub class do ApplicationController
    - definir action home
'
clanicioController < ApplicationController 
    def home
        
    end
end
'

# ADICIONANDO UMA FUNCIONALIDADE:
- rails generate migration create_projetos
    '   Running via Spring preloader in process 2459
        Expected string default value for '--jbuilder'; got true (boolean)
        invoke  active_record
        create    db/migrate/20170703140026_create_projetos.rb   '
- navegar para db > migrate > 9999999999999999_xxxxx.rb
- dentro deste arquivo vamos criar as colunas:
    > ERA
' 
class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
    end
  end
end
'
    > VIRA
'
class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.string :especialidade
      t.string :telefone
      t.string :endereco
    end
  end
end
'
- Agora é preciso rodar as migrações: rake db:migrate
'
== 20170703140026 CreateProjetos: migrating ====================================
-- create_table(:projetos)
   -> 0.0013s
== 20170703140026 CreateProjetos: migrated (0.0014s) ===========================
'
## ADICIONANDO UMA COLUNA A TABELA:
- rails generate migration add_email_to_projetos
'
Running via Spring preloader in process 3631
Expected string default value for '--jbuilder'; got true (boolean)
      invoke  active_record
      create    db/migrate/20170703142123_add_email_to_projetos.rb
'
- Navegar para o novo arquivo de migração: db > migrate > 999999999_add_emails_to_projetos.rb
    > ERA
'
class AddEmailToProjetos < ActiveRecord::Migration
  def change
  end
end
'
    >VIRA
'
class AddEmailToProjetos < ActiveRecord::Migration
  def change
    add_column :projetos, :email, :string
  end
end
'
"Note a sintaxe do comando: adicionar coluna, a tabela Projetos, seletor email, tipo string"
## ADICIONANDO TIMESTAMPS:
- No arquivo migrations, na definição do change:
'
class AddEmailToProjetos < ActiveRecord::Migration
  def change
    add_column :projetos, :email, :string
    add_column :projetos, :created_at, :datetime
    add_column :projetos, :updated_at, :datetime
  end
end
'
- Rodar a migração: rake db:migrate
'
== 20170703142123 AddEmailToProjetos: migrating ================================
-- add_column(:projetos, :email, :string)
   -> 0.0005s
-- add_column(:projetos, :created_at, :datetime)
   -> 0.0003s
-- add_column(:projetos, :updated_at, :datetime)
   -> 0.0003s
== 20170703142123 AddEmailToProjetos: migrated (0.0013s) =======================
'
## CRIANDO OS MODELS
- Navegar para app > models 
- criar novo arquivo chamado projeto.rb (no singular devido as convenções de nomenclatura)
    - declarar a classe o subclassear o record ativo
    '
Model name: Article, class: Article -> Capitalized A and singular

File name: article.rb -> singular and all lowercase

Controller file name: articles_controller.rb, class: ArticlesController -> camel case class name, snake case file name both plural

Views folder: articles

Table name: articles -> plural of model

Model name: User, class: User -> Capitalized U and singular

File name: user.rb -> singular and all lowercase

Controller file name: users_controller.rb, class: UsersController -> camel case class name, snake case file name both plural

Views folder: users

Table name: users -> plural of model

To generate a migration to create a table (in this example articles):

rails generate migration create_articles

To add attributes for the table in the migration file, add the following inside create_table block:

t.string :title

t.text :description

t.timestamps

To run the migration file and create the articles table:

rake db:migrate

OR

bundle exec rake db:migrate

To rollback a migration (undo the last migration):

rake db:rollback

To add a column (example: created_at column) to the articles table:

rails generate migration add_created_at_to_articles

Then within the def change method in the migration file:

add_column :articles, :created_at, :datetime

To add a different column (example: name) to a users table:

rails generate migration add_name_to_users

Then within the def change method in the migration file:

add_column :users, :name, :string

In the above two adding column methods, the first argument is the name of the table, second is the attribute name and third is the type

To create a model file for Article:

- In the app/models folder create a file called article.rb

- Fill it in with the following ->

class Article < ActiveRecord::Base

end

To start the rails console:

rails console

To test connection to the articles table:

Article.all # classname.all will list all the articles in the articles table

Then simply type in Article (classname) to view the attributes

To create a new article with attributes title and description:

article = Article.new(title: "This is a test title", description: "This is a test description")

article.save

OR

article = Article.new

article.title = "This is a test title"

article.description = "This is a test description"

article.save

Another method to do the same:

article = Article.create(title: "This is a test title", description: "This is a test description") # This will hit the table right away without needing the article.save line
    
    '
## RESUMAO:
Model name: Article, class: Article -> Capitalized A and singular

File name: article.rb -> singular and all lowercase

Controller file name: articles_controller.rb, class: ArticlesController -> camel case class name, snake case file name both plural

Views folder: articles

Table name: articles -> plural of model

Model name: User, class: User -> Capitalized U and singular

File name: user.rb -> singular and all lowercase

Controller file name: users_controller.rb, class: UsersController -> camel case class name, snake case file name both plural

Views folder: users

Table name: users -> plural of model

To generate a migration to create a table (in this example articles):

rails generate migration create_articles

To add attributes for the table in the migration file, add the following inside create_table block:

t.string :title

t.text :description

t.timestamps

To run the migration file and create the articles table:

rake db:migrate

OR

bundle exec rake db:migrate

To rollback a migration (undo the last migration):

rake db:rollback

To add a column (example: created_at column) to the articles table:

rails generate migration add_created_at_to_articles

Then within the def change method in the migration file:

add_column :articles, :created_at, :datetime

To add a different column (example: name) to a users table:

rails generate migration add_name_to_users

Then within the def change method in the migration file:

add_column :users, :name, :string

In the above two adding column methods, the first argument is the name of the table, second is the attribute name and third is the type

To create a model file for Article:

- In the app/models folder create a file called article.rb

- Fill it in with the following ->

class Article < ActiveRecord::Base

end

To start the rails console:

rails console

To test connection to the articles table:

Article.all # classname.all will list all the articles in the articles table

Then simply type in Article (classname) to view the attributes

To create a new article with attributes title and description:

article = Article.new(title: "This is a test title", description: "This is a test description")

article.save

OR

article = Article.new

article.title = "This is a test title"

article.description = "This is a test description"

article.save

Another method to do the same:

article = Article.create(title: "This is a test title", description: "This is a test description") # This will hit the table right away without needing the article.save line
## CRIANDO VALIDACOES NO MODEL:
- No app > models > projeto.rb:
    >ERA
'
class Projeto < ActiveRecord::Base
    
end
'
    >VIRA
'
class Projeto < ActiveRecord::Base
    validates :nome, presence: true
    validates :especialidade, presence: true
    validates :telefone, presence: true
    validates :endereco, presence: true
    validates :email, presence: true
end
'
## RESUMAO
Edit, Delete and Validations - Text directions and code
Seção 4, aula 61
To find an article with id 2 and edit it's title:

article = Article.find(2) # Here assumption is article with id of 2 was being looked for

article.title = "This is an edited title"

article.save

To delete an article, example with id 5:

article = Article.find(5)

article.destroy

To add validations presence and length validations to article model for title and description:

class Article < ActiveRecord::Base

validates :title, presence: true, length: {minimum: 3, maximum: 50}

validates :description, presence: true, length: {minimum: 10, maximum: 300}

end

To find errors in article object while saving (if it's rolled back):

article.errors.any?

article.errors.full_messages
## CRIANDO A GUI
### Criando a rota
- Vamos disponibilizar o recurso dentro da rota:
- Navegar para config > routes.rb
    > ERA
'
Rails.application.routes.draw do
   get 'inicio/home', to: 'inicio#home'
end
'
    > VIRA
'
Rails.application.routes.draw do
   get 'inicio/home', to: 'inicio#home'
   
    resources :projetos
end
'
- Criar o controller: Navegar para app > controllers > projetos_controller.rb
- Declarar a classe como subclasse do ApplicationController
- definir a ação new
'
class ProjetosController < ApplicationController
   def new
    end
end
'
- Navegar para app > layouts e criar pasta projetos
- Na pasta projetos criar arquivo new.html.erb
- No template, usar o helper form for.
- A sintaxe do embedded ruby é:
'
<h1>Criar novo Projeto</h1>

<%= form_for @projeto do |m| %>

<% end %>
'
- No projetos_controller, instaciar a variável @projeto
'
class ProjetosController < ApplicationController
   def new
       @projeto = Projeto.new
    end
end
'
- No template new, criar o formulario:
'
<h1>Criar novo Projeto</h1>

<%= form_for @projeto do |m| %>

<p>
    <%= m.label :nome %><br/>
    <%= m.text_field :nome %>
</p>
<p>
    <%= m.label :especialidade %><br/>
    <%= m.text_field :especialidade %>
</p>
<p>
    <%= m.label :endereco %><br/>
    <%= m.text_field :endereco %>
</p>
<p>
    <%= m.label :telefone %><br/>
    <%= m.text_field :telefone %>
</p>
<p>
    <%= m.label :email %><br/>
    <%= m.text_field :email %>
</p>

<%= m.submit %>

<% end %>
'
- Para que o formulário possa funcionar, é preciso criar a ação create no controller e listar o whitelist dos campos aprovados no private, e após salvar os dados no db, redirecionar o usuário para a visualização da entrada do Projeto
'
class ProjetosController < ApplicationController
   def new
       @projeto = Projeto.new
    end
    
   def create
       @projeto = Projeto.new(projeto_params)
       @projeto.save
       redirect_to projeto_path(@projeto)
    end
    
    private 
    def projeto_params
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email)
    end
    
end
'
### RESUMAO
Create New Articles from UI - Text directions and code
Seção 4, aula 63
In the config/routes.rb file add the following line to add all the routes for articles:

resources :articles

This will add the following routes:

routes path HTTP verb link controller#action

articles index articles GET /articles articles#index

new article new_article GET /articles/new articles#new

create article POST /articles articles#create

edit article edit_article GET /articles/:id articles#edit

update article PATCH /articles/:id articles#update

show article article GET /articles/:id articles#show

delete article DELETE /articles/:id articles#destroy

To create articles controller with a new action, under app/controllers create a file named articles_controller.rb (snake case):

class ArticlesController < ApplicationController

def new

@article = Article.new

end

end

To create a view, under app/views create a folder named articles and within it create a file named new.html.erb then fill in the following:

<h1>Create an article</h1>

<%= form_for @article do |f| %>

<p>

<%= f.label :title %><br/>

<%= f.text_field :title %>

</p>

<p>

<%= f.label :description %><br/>

<%= f.text_area :description %>

</p>

<p>

<%= f.submit %>

</p>

<% end %>

Create action and private article_params method for string parameters in the articles controller (Note: This is not complete):

def create

@article = Article.new(article_params)

@article.save

redirect_to article_path(@article)

end

private

def article_params

params.require(:article).permit(:title, :description)

end
- Convém executar ações diferentes caso tenhamas sucesso criando a nova entrado ou exibir uma mensagem de erro caso haja alguma falha na validação: Para isso vamos modificar o controller:
'
class ProjetosController < ApplicationController
   def new
       @projeto = Projeto.new
    end
    
   def create
       @projeto = Projeto.new(projeto_params)
       if @projeto.save
           flash[:notice] = "Projeto cadastrado com sucesso"
            redirect_to projeto_path(@projeto)
        else
            render 'new'
        end
    end
    
    private 
    def projeto_params
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email)
    end
    
end
'
- Como criamos uma mensagem de sucesso, presisamos que ela seja exibida. Utilizaremos o template base para que possamos aproveitar este elemento para exibir outras mensagens caso desejarmos. No arquivo app > views > layouts > application.html.erb
'
<!DOCTYPE html>
<html>
<head>
  <title>Workspace</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>
<div class="container">
  <%= flash.each do |name, msg| %>
<div class="alert alert-warning alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  <strong><%= msg %></strong>
</div>
  <% end %>
<%= yield %>
</div>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</body>
</html>
'
- As mensagens específicas dos erros de validação no template do formulario:
'
<% if @projeto.errors.any? %>
<ul>
<% @projeto.errors.full_messages.each do |msg| %>
<li><%= msg %></li>
<% end %>
</ul>
<% end %>
'
- Para que lidar com a mesagem de erro após o envio do formulário que diz que a ação show não está difinida. No controller definir a ação show e passar o id que está na hash da ulr:
'
class ProjetosController < ApplicationController
   def new
       @projeto = Projeto.new
    end
    
   def create
       @projeto = Projeto.new(projeto_params)
       if @projeto.save
           flash[:notice] = "Projeto cadastrado com sucesso"
            redirect_to projeto_path(@projeto)
        else
            render 'new'
        end
    end
    
    def show
        @projeto = Projeto.find(params[:id])    
    end
    private 
    def projeto_params
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email)
    end
    
end
'
- Criar o template para exibir a entrada. Criar em app > views > projetos > show.html.erb
'
<h1><%= @projeto.nome %></h1>
<hr>
<p>Especialidade:</p>
<span><%= @projeto.especialidade %></span>
<hr>
<p>Telefone:</p>
<span><%= @projeto.telefone %></span>
<hr>
<p>Endereço:</p>
<span><%= @projeto.endereco %></span>
<hr>
<p>Email:</p>
<span><%= @projeto.email %></span>
'
### RESUMAO
Complete New and Show Actions - Text directions and code
Seção 4, aula 65
Completed create action in articles controller:

def create

@article = Article.new(article_params)

if @article.save

flash[:notice] = "Article was successfully created"

redirect_to article_path(@article)

else

render 'new'

end

end

Flash message code added to application.html.erb under app/views/layouts folder (right under <body> and above <%= yield %>:

<% flash.each do |name, msg| %>

<ul>

<li><%= msg %></li>

</ul>

<% end %>

Code added to display errors in the new.html.erb template under app/views/articles folder:

<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

<ul>

<% @article.errors.full_messages.each do |msg| %>

<li><%= msg %></li>

<% end %>

</ul>

<% end %>

To create the show action, add the following show method to articles_controller.rb file:

def show

@article = Article.find(params[:id])

end

To create the show view, add a show.html.erb file under the app/views/articles folder and fill in the code:

<h1>Showing selected article</h1>

<p>

Title: <%= @article.title %>

</p>

<p>

Description: <%= @article.description %>

</p>
### EDITANDO MEDICOS PELA GUI
- Criar a ação edit no controller
- Criar template app > views > projetos > edit.html.erb
- Disponibilizar a variável @projeto no controller
- Criar a ação update no controller
'
class ProjetosController < ApplicationController
   def new
       @projeto = Projeto.new
    end
    
   def create
       @projeto = Projeto.new(projeto_params)
       if @projeto.save
           flash[:notice] = "Projeto cadastrado com sucesso"
            redirect_to projeto_path(@projeto)
        else
            render 'new'
        end
    end
    
    def show
        @projeto = Projeto.find(params[:id])    
    end
    
    def edit
        @projeto = Projeto.find(params[:id])
    end
    
    def update
        @projeto = Projeto.find(params[:id])
        if @projeto.update(projeto_params)
            flash[:notice] = "Dados atualizados com sucesso"
            redirect_to projeto_path(@projeto)
        else
            render 'edit'
        end
    end
    
    private 
    def projeto_params
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email)
    end
    
end
'
### RESUMAO
Edit Articles - Text directions and code
Seção 4, aula 67
Route for editing articles takes the form ->

/articles/:id/edit

Edit action in the articles controller:

def edit

@article = Article.find(params[:id])

end

Update action in the articles controller:

def update

@article = Article.find(params[:id])

if @article.update(article_params)

flash[:notice] = "Article was successfully updated"

redirect_to article_path(@article)

else

render 'edit'

end

end

To create edit template, create a file named edit.html.erb under the app/views/articles folder and fill in the following code:

<h1>Edit existing article</h1>

<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

<ul>

<% @article.errors.full_messages.each do |msg| %>

<li><%= msg %></li>

<% end %>

</ul>

<% end %>

<%= form_for @article do |f| %>

<p>

<%= f.label :title %><br/>

<%= f.text_field :title %>

</p>

<p>

<%= f.label :description %><br/>

<%= f.text_area :description %>

</p>

<p>

<%= f.submit %>

</p>

<% end %>
### LISTANDO ProjetoS NA GUI
- Para listar todos os Projetos cadastrados usaremos a ação index conforme mostrado no rake routes definir index no controller
- Criar template em 'app > views > projetos > index.html.erb'
- No controller, criar a variável @projetos que retorna todos os Projetos cadastrados
- No template adicionar loop:
'
<% @projetos.each do |projeto| %>
<% end %>
'
- Adicionar botão criar novo Projeto:
<%= link_to "Cadastrastrar novo Projeto", new_projeto_path %>
- Criar botões para mostrar detalhes e editar o cadastro:
    <button type="button" class="btn btn-default"> <%= link_to "Ver Detalhes", projeto_path(projeto) %> </button>
    <button type="button" class="btn btn-info"><%= link_to "Editar Projeto", edit_projeto_path(projeto) %></button>
### RESUMAO
List Articles and Layout Links - Text directions and code
Seção 4, aula 69
To create listings index first add the index action to acticles controller:

def index

@articles = Article.all

end

Create the view file index.html.erb under app/views/articles folder:

<h1>Listing all articles</h1>

<p>

<%= link_to "Create new article", new_article_path %>

</p>

<table>

<tr>

<th>Title</th>

<th>Description</th>

</tr>

<% @articles.each do |article| %>

<tr>

<td><%= article.title %></td>

<td><%= article.description %></td>

<td><%= link_to 'Edit', edit_article_path(article) %></td>

<td><%= link_to 'Show', article_path(article) %></td>

</tr>

<% end %>

</table>

Then update the views with links ->

show.html.erb:

<h1>Showing selected article</h1>

<p>

Title: <%= @article.title %>

</p>

<p>

Description: <%= @article.description %>

</p>

<%= link_to "Edit this article", edit_article_path(@article) %> |

<%= link_to "Back to articles listing", articles_path %>

Add the back to articles listing path to the bottom of both new.html.erb and edit.html.erb pages:

<%= link_to "Back to articles listing", articles_path %>

### REFATORANDO ELEMENTOS DA GUI
- Para criar um template reutilizável, na pasta app > views > _form.html.erb (começa com _)
- Transportar o código dos formulários e no new.html:
'
<%= render 'form' %>
'
Simplesmente 'form' porque o template está na mesma página do arquivo que renderiza esse template
- Fazer o mesmo em edit.html
- Para refatorar o elemento de mensagens criar um arquivo _messages.html.erb
- Refatorar o menu e o rodape da mesma maneira.
- Todos estes templates estão dentro da pasta layouts então a tag para renderizar estes elementos tem que ser
'
 <%= render 'layouts/rodape' %>
'
### DESTRUINDO ENTRADAS NA GUI:
- Definir a ação destroy no controller
'
def destroy
        @projeto = Projeto.find(params[:id])
        @projeto.destroy
        flash[:notice] = "Projeto apagado com sucesso"
        redirect_to projetos_path
    end
    
'
- Colocar o botão deletar na lista de Projetos
<%= link_to 'Delete', article_path(article), method: :delete, data: {confirm: "Are you sure?"} %></td>
### RESUMAO
Destroy and Partials - Text directions and code
Seção 4, aula 71
Add this link to the homepage (root route) so you can access the blog from the homepage:

<%= link_to "Alpha Blog", articles_path %>

Under app/views/layouts folder create a _messages.html.erb file (messages partial) and remove the following code from application.html.erb to this file:

<% flash.each do |name, msg| %>

<ul>

<li><%= msg %></li>

</ul>

<% end %>

In place of this code in the application.html.erb add the following code:

<%= render 'layouts/messages' %>

Create a file under app/views/articles folder called _form.html.erb and fill it in with the following code (copied from the new or edit.html.erb page):

<% if @article.errors.any? %>

<h2>The following errors prevented the article from getting created</h2>

<ul>

<% @article.errors.full_messages.each do |msg| %>

<li><%= msg %></li>

<% end %>

</ul>

<% end %>

<%= form_for @article do |f| %>

<p>

<%= f.label :title %><br/>

<%= f.text_field :title %>

</p>

<p>

<%= f.label :description %><br/>

<%= f.text_area :description %>

</p>

<p>

<%= f.submit %>

</p>

<% end %>

<%= link_to "Back to articles listing", articles_path %>

Then remove the code above from both new.html.erb and edit.html.erb files and in it's place add the following code:

<%= render 'form' %>

To add the destroy method, first add the following to the articles controller:

def destroy

@article = Article.find(params[:id])

@article.destroy

flash[:notice] = "Article was successfully deleted"

redirect_to articles_path

end

Then in the index.html.erb (listings page) add the following link as one of the <td> items under the show article link:

<td><%= link_to 'Delete', article_path(article), method: :delete, data: {confirm: "Are you sure?"} %></td>

### CRIANDO UM METODO
- Em app > cotrollers > projetos_controller.rb
- Definir o método privado set_projeto, dentro deste método a variável @projeto e  passar a variável que se repete várias vezes
- Como esta variável tem que estar disponível antes de executar os métodos, declarar logo depois de criar a classe:
    private 
    def set_projeto
        @projeto = Projeto.find(params[:id])
    end
    def projeto_params
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email)
    end
## DEPLOY NO HEROKU
- Editar GEMFILE:
- Como o Heroku não aceita sqlite, 
- levar a gem sqlite para os parametros especificos de desenvolvimento 
- declarar os parametros especificos de produção e declarar as gems 'pg' para o postgres e rails_12factor para a autenticação.
'
group :development do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
'
- rodar bundle install --without production para não alterar o ambiente local com as configurações de produção
'
Bundle complete! 14 Gemfile dependencies, 56 gems now installed.
Gems in the group production were not installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
'
- checar se o heroku toolbelt está disponível no ambiente: heroku version
'
kentarofujiy:~/workspace (add_heroku) $ heroku version
heroku-toolbelt/3.43.16 (x86_64-linux) ruby/2.3.0
heroku-cli/5.12.0-0ab8352 (linux-amd64) go1.7.5
You have no installed plugins.
'
- logar no heroku: heroku login
'
Enter your Heroku credentials:
Email: kentaro@manacadigital.com.br
Password: **********
Logged in as kentaro@manacadigital.com.br
'
- heroku create
'
kentarofujiy:~/workspace (add_heroku) $ heroku create
Creating app... done, ⬢ nameless-journey-46370
https://nameless-journey-46370.herokuapp.com/ | https://git.heroku.com/nameless-journey-46370.git
'
-  heroku keys:add
'
kentarofujiy:~/workspace (master) $ heroku keys:add
Found an SSH public key at /home/ubuntu/.ssh/id_rsa.pub
? Would you like to upload it to Heroku? Yes
Uploading /home/ubuntu/.ssh/id_rsa.pub SSH key... done
'
- finalmente: git push heroku master
'
remote: -----> Compressing...
remote:        Done: 38.4M
remote: -----> Launching...
remote:        Released v5
remote:        https://nameless-journey-46370.herokuapp.com/ deployed to Heroku
remote: 
remote: Verifying deploy... done.
To https://git.heroku.com/nameless-journey-46370.git
 * [new branch]      master -> master
'
- O heroku gera um nome aletório que pode ser trocado com a seguinte comando: heroku rename bigsaude
- Se acessarmos a aplicação agora, os Projetos não estarão disponíveis porque alteramos as tabelas então é peciso rodar o seguinte comando: heroku run rake db:migrate
'
kentarofujiy:~/workspace (master) $ heroku run rake db:migrate
Running rake db:migrate on ⬢ bigsaude... up, run.2362 (Free)
The PGconn, PGresult, and PGError constants are deprecated, and will be
removed as of version 1.0.

You should use PG::Connection, PG::Result, and PG::Error instead, respectively.

Called from /app/vendor/bundle/ruby/2.3.0/gems/activesupport-4.2.5/lib/active_support/dependencies.rb:240:in `load_dependency'
   (17.6ms)  CREATE TABLE "schema_migrations" ("version" character varying NOT NULL) 
   (7.7ms)  CREATE UNIQUE INDEX  "unique_schema_migrations" ON "schema_migrations"  ("version")
  ActiveRecord::SchemaMigration Load (4.6ms)  SELECT "schema_migrations".* FROM "schema_migrations"
Migrating to CreateProjetos (20170703140026)
   (3.4ms)  BEGIN
== 20170703140026 CreateProjetos: migrating ====================================
-- create_table(:projetos)
   (12.5ms)  CREATE TABLE "projetos" ("id" serial primary key, "nome" character varying, "especialidade" character varying, "telefone" character varying, "endereco" character varying) 
   -> 0.0143s
== 20170703140026 CreateProjetos: migrated (0.0144s) ===========================

  SQL (9.5ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1)  [["version", "20170703140026"]]
   (4.9ms)  COMMIT
Migrating to AddEmailToProjetos (20170703142123)
   (3.5ms)  BEGIN
== 20170703142123 AddEmailToProjetos: migrating ================================
-- add_column(:projetos, :email, :string)
   (5.3ms)  ALTER TABLE "projetos" ADD "email" character varying
   -> 0.0129s
-- add_column(:projetos, :created_at, :datetime)
   (9.3ms)  ALTER TABLE "projetos" ADD "created_at" timestamp
   -> 0.0099s
-- add_column(:projetos, :updated_at, :datetime)
   (2.7ms)  ALTER TABLE "projetos" ADD "updated_at" timestamp
   -> 0.0031s
== 20170703142123 AddEmailToProjetos: migrated (0.0265s) =======================

  SQL (3.8ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1)  [["version", "20170703142123"]]
   (5.6ms)  COMMIT
kentarofujiy:~/workspace (master) $ 
'
### CRIANDO UM MÓDULO DE AUTENTICAÇÃO:
- Começar criando a miração: rails generate migration create_users
'
kentarofujiy:~/workspace (auth_pt1) $ rails generate migration create_users
Running via Spring preloader in process 7194
Expected string default value for '--jbuilder'; got true (boolean)
      invoke  active_record
      create    db/migrate/20170715232856_create_users.rb
'
- No arquivo de migração: 
'
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.timestamps
    end
  end
end
'
- rodar a migração: rake db:migrate
'kentarofujiy:~/workspace (auth_pt1) $ rails generate migration create_users
Running via Spring preloader in process 7194
Expected string default value for '--jbuilder'; got true (boolean)
      invoke  active_record
      create    db/migrate/20170715232856_create_users.rb
kentarofujiy:~/workspace (auth_pt1) $ rake db:migrate
== 20170715232856 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 0.0015s
== 20170715232856 CreateUsers: migrated (0.0016s) =============================
'
###Criar o modelo: 
- Em app > models > user.rb (novo arquivo)
- declarar a classe subclasse do active record:base
'
class User < ActiveRecord:Base
    
end
'
#### resumão:
Create Users - Text directions and code
Seção 6, aula 92
To create a feature branch:

git checkout -b nameofbranch

To create a feature branch named create-users:

git checkout -b create-users

To view list of branches:

git branch

To move to master branch:

git checkout master

To move to already created feature branch:

git checkout nameofbranch

Important to remember is to always have master branch deployable to production and work on all new features and additions in feature branches

To create a migration to create users table:

rails generate migration create_users

Then within the migration file add in the following within the create_table block to add the username, email and timestamps columns (created_at and updated_at):

t.string :username

t.string :email

t.timestamps

To run the migration file and create the users table:

rake db:migrate

Add a user.rb model file under app/models folder and fill in the following:

class User < ActiveRecord::Base

end

Then start rails console and test out connections:

rails console

User.all

User

user = User.create(username: "test", email: "test@example.com")

user = User.create(username: "test2", email: "test2@example.com")

To grab first user and update their email address:

user = User.find(1)

OR

user = User.first

user.email = "test3@example.com"

user.save

To destroy user with id = 2:

user = User.find(2)

user.destroy

To make a commit of the changes made in the feature branch:

git add -A

git commit -m "create users table and user model"

To merge the changes in the feature branch to the master branch first switch to master branch:

git checkout master

git merge nameofbranch

git push to push code to repository

To delete a feature branch that is no longer needed and has been merged to master already:

git branch -d nameofbranch

To delete a feature branch that is no longer needed but has NOT been merged to master:

git branch -D nameofbranch
### Validando os campos:
- No model, usar as validações do ruby (Active Record Validation)
'
class User < ActiveRecord:Base
    validates :username, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: { minumum: 3, maximum: 25 }
        
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: {  maximum: 105 }, 
        format: { with VALID_EMAIL_REFGEX }
end
'
### ASSOCIANDO A TABELA MEDICOS A TABELA USUARIOS
- Criar a maigração: rails generate migration add_user_id_to_projetos
'kentarofujiy:~/workspace (auth_pt2) $ rails generate migration add_user_id_to_projetos
Running via Spring preloader in process 8326
Expected string default value for '--jbuilder'; got true (boolean)
      invoke  active_record
      create    db/migrate/20170716001759_add_user_id_to_projetos.rb'
- No arquivo de migração:
'class AddUserIdToProjetos < ActiveRecord::Migration
  def change
      add_column :articles, :user_id, :integer
  end
end'
- Rodar a migração: rake db:migrate
'kentarofujiy:~/workspace (auth_pt2) $ rake db:migrate
== 20170716001759 AddUserIdToProjetos: migrating ===============================
-- add_column(:projetos, :user_id, :integer)
   -> 0.0027s
== 20170716001759 AddUserIdToProjetos: migrated (0.0028s) ======================
'
- A assossiação one-to-many, uma vez que o usuário pode criar vários cadastros de Projeto:
- No user.rb:
```ruby
class User < ActiveRecord::Base
    has_many :projetos
    validates :username, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: { minumum: 3, maximum: 25 }
        
    VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: {  maximum: 105 }, 
        format: { with VALID_EMAIL_REFGEX }
end
```

- No projeto.rb:
'class Projeto < ActiveRecord::Base
    belongs_to :user
    validates :nome, presence: true
    validates :especialidade, presence: true
    validates :telefone, presence: true
    validates :endereco, presence: true
    validates :email, presence: true
end'
- Ao ligar usando has_many no criador e belongs_to no objeto, as duas tabelas estão conectadas
- Para exigir que o cadastro do Projeto tenha um usuario criador: 
- Adicionar a validação de presença 
'   validates :user_id, presence: true
'
> NESTE PONTO NAO SERA POSSIVEL CRIAR UM MEDICO DA UI. SE ISSO ACONTECEU, E PORQUE VOCE NAO USOU A CONSOLE PARA TESTAR SE O MODEL DO USUARIO ESTAVA FUNCIONANDO (KENTARO DO FUTURO, QUE VERGONHA DE VOCE)
> Faz assim vai em rails console e user = User.new(username: "kentaro", email: "kentaro@manacadigital.com.br") depois user.save
> Disponibilize a variável no projetos-controller.rb: @projeto.user = User.first
#### Resumão:
One to Many Association - Text directions and code
Seção 6, aula 96
To generate a migration to add user_id column to articles table:

rails generate migration add_user_id_to_articles

Then within the change method:

add_column :articles, :user_id, :integer

Then run the migration file to effect the change:

rake db:migrate

Add the following line to article.rb model file:

belongs_to :user

Add the following line to user.rb model file:

has_many :articles

Also add the following line to user.rb model file(this has nothing to do with the association):

before_save { self.email = email.downcase }

Ensure you have a couple of users created by using the rails console. Then add in 1 line to grab a user to the create action to temporarily hardcode a user to articles:

def create

@article = Article.new(article_params)

@article.user = User.first

if @article.save

flash[:success] = "Article was successfully created"

redirect_to article_path(@article)

else

render 'new'

end

end

Ensure you get rid of the debugger line if you no londer need it within the create action, you can add that line as you need to your actions if you want to pause execution of a request

You can add in the following line to display the debug(params) to your development environment UI output:

(this will be in the app/views/layouts/application.html.erb file under render footer and above </body>)

<%= debug(params) if Rails.env.development? %>
### Mostrando dados de uma tabela no controller da outra. Neste caso mosrtando o nome do usuario na view do projeto
- em index.html.erb
```html
<div class="media">
  <div class="media-left">
    <a href="#">
      <img class="media-object" src="http://via.placeholder.com/150x150" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading"><%= projeto.nome %></h4>
    <small>Especialidade: <%= projeto.especialidade %></small>
    ***<div class="article-meta-details">

    <small>Created by: <%= projeto.user.username if projeto.user%>,

    <%= time_ago_in_words(projeto.created_at) %> ago,

    last updated: <%= time_ago_in_words(projeto.updated_at) %> ago</small>

    </div>***
    <hr>
    <button type="button" class="btn btn-default"> <%= link_to "Ver Detalhes", projeto_path(projeto) %> </button>
    <button type="button" class="btn btn-info"><%= link_to "Editar Projeto", edit_projeto_path(projeto) %></button>
    <button type="button" class="btn btn-danger"><%= link_to "Apagar Projeto", projeto_path(projeto), method: :delete, data: {confirm: "Você tem certeza?"} %></button>
  </div>
</div>

<% end %>
```
### Criando novos usuários pela UI
- user.rb
```ruby
class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    has_many :projetos
    validates :username, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: { minumum: 3, maximum: 25 }
        
    VALID_EMAIL_REGEX  =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
        presence: true, 
        uniqueness: { case_sensitive: true }, 
        length: {  maximum: 105 }, 
        format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end
````
-no gemfile adicionar a gem bcrypt

gem 'bcrypt', '~> 3.1.7'

- Rodar bundle install para instalar a gem
- adicicionar o campo da senha na tabela users:
-- rails generate migration add_password_digest_to_users
-- no arquivo de migração:
```ruby
class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end
```
- rodar rake db:migrate
##### Criando usuarios a partir da UI:
- routes.rb
```ruby
Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
root 'inicio#home'
   
    resources :projetos
    
  get 'cadastrar', to: 'users#new'
  ```
  - Criar users_controller.rb
 ```ruby
 class UsersController < ApplicationController
    def new
    end
end
```
- criar template
-- Em app > views criar pasta users
-- criar arquivo new.html.erb
```html
<div class="jumbotron">
<h1>Criar novo Usuário</h1>
</div>

<div class='row'>
   <div class='col-xs-12'>
      <%= form_for(@user, :html => {class: "form-horizontal", role: "form"}) do |f| %>
      <div class="form-group">
         <div class="control-label col-sm-2">
            <%= f.label :username %>
         </div>
         <div class="col-sm-8">
            <%= f.text_field :username, class: "form-control", placeholder: "Escolha um nome de usuário", autofocus: true %>
         </div>
      </div>
      <div class="form-group">
         <div class="control-label col-sm-2">
            <%= f.label :email %>
         </div>
         <div class="col-sm-8">
            <%= f.email_field :email, class: "form-control", placeholder: "Seu e-mail" %>
         </div>
      </div>
      <div class="form-group">
         <div class="control-label col-sm-2">
            <%= f.label :password %>
         </div>
         <div class="col-sm-8">
            <%= f.password_field :password, class: "form-control", placeholder: "Sua senha" %>
         </div>
      </div>
      <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <%= f.submit "Cadastrar", class: 'btn btn-primary btn-lg' %>
         </div>
      </div>
      <% end %>
      <div class="col-xs-4 col-xs-offset-4">
         [ <%= link_to "Cancelar e voltar para a lista de Projetos", projetos_path %> ]
      </div>
   </div>
</div>
```
- em routes.rb
resources :users, except: [:new]
### Editando users da UI
- Criar a ação edit e update no contoller
```ruby
def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
            if @user.update(user_params)
                flash[:success] = "Sua conta foi atualizada com sucesso"
                    redirect_to articles_path
            else
                render 'edit'
            end
    end
end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end

```
- Criar template edit.html.erb
```html
<div class="jumbotron">
<h1>Editar sua conta</h1>
</div>

<div class='row'>
   <div class='col-xs-12'>
      <%= form_for(@user, :html => {class: "form-horizontal", role: "form"}) do |f| %>
      <div class="form-group">
         <div class="control-label col-sm-2">
            <%= f.label :username %>
         </div>
         <div class="col-sm-8">
            <%= f.text_field :username, class: "form-control", placeholder: "Escolha um nome de usuário", autofocus: true %>
         </div>
      </div>
      <div class="form-group">
         <div class="control-label col-sm-2">
            <%= f.label :email %>
         </div>
         <div class="col-sm-8">
            <%= f.email_field :email, class: "form-control", placeholder: "Seu e-mail" %>
         </div>
      </div>
      <div class="form-group">
         <div class="control-label col-sm-2">
            <%= f.label :password %>
         </div>
         <div class="col-sm-8">
            <%= f.password_field :password, class: "form-control", placeholder: "Sua senha" %>
         </div>
      </div>
      <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <%= f.submit "Atualizar", class: 'btn btn-primary btn-lg' %>
         </div>
      </div>
      <% end %>
      <div class="col-xs-4 col-xs-offset-4">
         [ <%= link_to "Cancelar e voltar para a lista de Projetos", projetos_path %> ]
      </div>
   </div>
</div>
```
- Para simplificar vamos mover os formularios do new e edit para uma parcial:
- Nos arquivos /users/new e edit.html.erb
```html
<div class="jumbotron">
<h1>Criar novo Usuário</h1>
</div>

<%= render 'form' %>
```
- Existe uma diferença entre estes 2 arquivos no botão porque em um caso a ação é criar e no outro e editar. Como existe uma situação onde podemos checar se o usuário é um novo registro, podemos modificar o código do botão para responder a esta diferença.
```html
 <div class="form-group">
         <div class="col-sm-offset-2 col-sm-10">
            <%= f.submit(@user.new_record? ? "Cadastrar" : "Salvar Alterações", class: 'btn btn-primary btn-lg') %>
         </div>
      </div>
```
#### Listando os usuários na GUI
- Rake routes mostra
Unknown action
The action 'index' could not be found for UsersController
- Criar a ação show no controller:
```ruby
  def show
        @user = User.find(params[:id])
    end
```
- Criar o template: /users/show.html.erb
```html
```
- Neste template estamos usando o Gravatar, então no application_helper.rb
```ruby
module ApplicationHelper
    def gravatar_for(user, options = { size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "img-circle")
    end
end
```
#### Listar todos os projetos criados pelo usuário:
- Criar arquivo para parcial /projetos/_projeto.html.erb
```html
<% obj.each do |projeto| %>

<div class="media">
  <div class="media-left">
    <a href="#">
      <img class="media-object" src="http://via.placeholder.com/150x150" alt="...">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading"><%= projeto.nome %></h4>
    <small>Especialidade: <%= projeto.especialidade %></small>
    <div class="article-meta-details">

    <small>Criado por: <%= projeto.user.username if projeto.user%>,

    às <%= time_ago_in_words(projeto.created_at) %>,

    ultima atualização: <%= time_ago_in_words(projeto.updated_at) %></small>

    </div>
    <hr>
    <button type="button" class="btn btn-default"> <%= link_to "Ver Detalhes", projeto_path(projeto) %> </button>
    <button type="button" class="btn btn-info"><%= link_to "Editar Projeto", edit_projeto_path(projeto) %></button>
    <button type="button" class="btn btn-danger"><%= link_to "Apagar Projeto", projeto_path(projeto), method: :delete, data: {confirm: "Você tem certeza?"} %></button>
  </div>
</div>

<% end %>
```
- No projetos/index.html.erb
```html
<div class="jumbotron">
<h1>Lista Projetos</h1>
<%= link_to "Cadastrastrar novo Projeto", new_projeto_path %>
</div>
<%= render 'projeto', obj: @projetos %>
```
- No /users/show.html.erb
```html
<div class="jumbotron">
<h1>Perfil do usuário</h1>
</div>
<h1 align="center">Welcome to <%= @user.username %>'s page</h1>

<div class="row">

<div class="col-md-4 col-md-offset-4 center">

<%= gravatar_for @user, size: 150 %>

</div>

</div>

<h4 align="center">Projetos criados por:<%= @user.username %></h4>
<%= render 'projetos/projeto', obj: @user.projetos %>
```
#### Listando todos os usuários na GUI
- Definir a ação index no controller:
```ruby
def index

@users = User.all

end
``` 
- Criar template /users/index.html
```html
<div class="jumbotron">
<h1>Lista de Usuários</h1>
</div>

<% @users.each do |user| %>
<ul class="listing">
   <div class="row">
      <div class="well col-md-4 col-md-offset-4">
         <li><%= link_to gravatar_for(user), user_path(user) %></li>
         <li class="article-title">
            <%= link_to user.username, user_path(user) %>
         </li>
         <li><small><%= pluralize(user.projetos.count, "projeto") if user.projetos %></small></li>
      </div>
   </div>
</ul>
<% end %>
</div>
```
#### Adicionando a paginação
- Instalar a gem
```ruby

gem 'will_paginate', '3.0.7'
gem 'bootstrap-will_paginate', '0.0.10'
```
- Rodar bundle install sem produção
- Para que o ruby separe os records em listas do tamanho da paginação desejada, vamos modificar as ações que serão paginadas no controller.
```ruby
    def index
        @projetos = Projeto.paginate(page: params[:page], per_page: 5)
    end
```
- Modificar o template para paginar /projetos/index.html.erb
```html
<div class="jumbotron">
<h1>Lista Projetos</h1>
<%= link_to "Cadastrastrar novo Projeto", new_projeto_path %>
</div>
<%= render 'projeto', obj: @projetos %>
<div align="center">
<%= will_paginate %>
</div>
```
### Logando usauários
- Criar a rota
```ruby
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  ```
- Criar o controller sessions_controller.erb
```ruby
class SessionsController < ApplicationController

def new

end

def create

end

def destroy

end

end
```
- Criar o template /views/sessions/new.html.erb
```html
<h1 align="center">Log in</h1>
    <%= form_for(:session, :html => {class: "form-horizontal", role: "form"}, url: login_path) do |f| %>

    <div class="form-group">
        <div class="control-label col-sm-2">
            <%= f.label :email %>
        </div>
        <div class="col-sm-8">
            <%= f.email_field :email, class: "form-control", placeholder: "Seu e-mail", autofocus: true %>
        </div>

    </div>

    <div class="form-group">
        <div class="control-label col-sm-2">
            <%= f.label :password %>
        </div>
        <div class="col-sm-8">
            <%= f.password_field :password, class: "form-control", autocomplete: "off" %>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <%= f.submit "Entrar", class: 'btn btn-primary btn-lg' %>
        </div>
    </div>
<% end %>

    <div class="col-xs-4 col-xs-offset-4">
        [ <%= link_to "Cancelar e voltar", projetos_path %> ]
    </div>
```
- Uma vez que o formulério seja enviado, a ação create e invocada, então preciso criar esta ação:
```ruby
class SessionsController < ApplicationController

def new

end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Bem Vindo!"
        redirect_to user_path(user)
    else
        flash.now[:danger] = "Dados incorretos"
        render 'new'
    end
end



def destroy
    session[:user_id] = nil
    flash[:success] = "Logout com sucesso!"
    redirect_to root_path
end

end 
```

- Não adianta colocar logout na url porque precisams especificar cual é o método http utilizado no request, então criar um link
- 
```html

        <li><%= link_to 'Sair', logout_path, method: :delete %></li>

```
#### Criando o estado de logado
- No application controller:
```ruby 
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  helper_method :current_user, :logged_in?

def current_user

@current_user ||= User.find(session[:user_id]) if session[:user_id]

end

def logged_in?

!!current_user

end

def require_user

if !logged_in?

flash[:danger] = "Você precisa estar logado para fazer issso"

redirect_to root_path

end

end

end
```
- Na navbar
```html
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Big</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <li class=""><a href="/">Home</a></li>
      <% if logged_in? %>
        <li><a href="/projetos">Lista Projetos</a></li>
        <li><a href="/projetos/new">Cadastrar Projetos</a></li>
        <% end %>
        </ul>
      <ul class="nav navbar-nav navbar-right">
        <% if logged_in? %>
        <li><%= link_to 'Sair', logout_path, method: :delete %></li>
        <li class="dropdown">
         <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Perfil<span class="caret"></span></a>
         <ul class="dropdown-menu">
          <li><%= link_to "Editar seu perfil", edit_user_path(current_user) %></li>
          <li><%= link_to "Ver seu perfil", user_path(current_user) %></li>
   </ul>
</li>
        <% else %>
        <li><%= link_to 'Entrar', login_path %></li>
        <li><%= link_to 'Criar Conta', cadastrar_path %></li>
        <% end %>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<div class="container">
``` 
- As restrições feitas no link não impedem que o usuário navegue até um a url de edição, portanto vamos restringir o acesso dos controllers:
- users_controller.rb
```ruby 
class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                flash[:success] = "Bem vindo a Big #{@user.username}!!!"
                redirect_to user_path(@user)
            else
                render 'new'
            end
    end
    def edit
  
    end

    def update
                if @user.update(user_params)
                flash[:success] = "Sua conta foi atualizada com sucesso"
                    redirect_to projetos_path
            else
                render 'edit'
            end
    end
    
    def show
        @user_projetos = @user.projetos.paginate(page: params[:page], per_page: 1)
    end
    
    def index
       @users = User.paginate(page: params[:page], per_page: 1)
    end
    
end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
        def set_user
            @user = User.find(params[:id])
        end
        def require_same_user
            if current_user != @user
                flash[:danger] = "Você não tem permissão"
                redirect_to root_path
            end
        end
```
- No projetos_controller.rb
```ruby
class ProjetosController < ApplicationController
    before_action :set_projeto, only: [:edit, :update, :show, :destroy]
    before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        
        @projetos = Projeto.paginate(page: params[:page], per_page: 5)
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
        params.require(:projeto).permit(:nome, :especialidade, :endereco, :telefone, :email)
    end
    def require_same_user
        if current_user != @projeto.user
            flash[:danger] = "Vecê não tem permissão"
            redirect_to root_path
        end
    end
end
```
### ADICIONANDO UM ADMIN SIMPLES BOOLEAN
- Gerar a migração:
```rails generate migration add_admin_to_users```
- No arquivo da migração, adicionar a coluna
```ruby
class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
```
- Rodar o rake migrate
```bash
kentarofujiy:~/workspace (admin_pt1) $ rake db:migrate
== 20170717192526 AddAdminToUsers: migrating ==================================
-- add_column(:users, :admin, :boolean, {:default=>false})
   -> 0.0060s
== 20170717192526 AddAdminToUsers: migrated (0.0061s) =========================
```
### EXIGIR QUE O USUÁRIO SEJA ADMINISTRADOR PARA APAGAR 
```ruby
class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    before_action :require_same_user, only: [:edit, :update]
    before_action :require_admin, only: [:destroy]
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                flash[:success] = "Bem vindo a Big #{@user.username}!!!"
                redirect_to user_path(@user)
            else
                render 'new'
            end
    end
    def edit
  
    end

    def update
                if @user.update(user_params)
                flash[:success] = "Sua conta foi atualizada com sucesso"
                    redirect_to projetos_path
            else
                render 'edit'
            end
    end
    
    def show
        @user_projetos = @user.projetos.paginate(page: params[:page], per_page: 1)
    end
    
    def index
       @users = User.paginate(page: params[:page], per_page: 1)
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:danger] = "Atenção: Esta ação apagará este usuário e todos os Projetos cadastrados por ela"
        redirect_to users_path
    end
    
end

    private
        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
        def set_user
            @user = User.find(params[:id])
        end
        def require_same_user
            if current_user != @user
                flash[:danger] = "Você não tem permissão"
                redirect_to root_path
            end
        end
        def require_admin
            if logged_in? and !current_user.admin?
                flash[:danger] = "Você precisa de permissão de administrador para fazer isto"
                redirect_to root_path
        end
        end

```
## ADICIONANDO CATEGORIAS
### Criando o modelo a partir dos testes:
- Em test > models > category_test.rb
- Criar a tabela Categories
```ruby
rails generate migration create_categories
```
- No arquivo de migração:
```ruby
t.string :name
t.timestamps
```
- Rodar a migração:
```bash
kentarofujiy:~/workspace (master) $ rake db:migrate
== 20170719150431 CreateCategories: migrating =================================
-- create_table(:categories)
   -> 0.0023s
== 20170719150431 CreateCategories: migrated (0.0024s) ========================
```
- Criar o modelo e validar o campo: category.rb
```ruby 
class Category < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
end
```
- Criar o unit test: category_test.rb
```ruby
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    def setup
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "name should not be too long" do
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end

end
```
### Rodando o teste:
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 27156

# Running:

.....

Finished in 0.064840s, 77.1124 runs/s, 77.1124 assertions/s.

5 runs, 5 assertions, 0 failures, 0 errors, 0 skips
```
### Criando o controller a partir dos testes:
- Na pasta test > controller > categories_controller_test.rb:
```ruby
require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    test "Deve retornar a lista de categorias" do
        get :index
        assert_response :success
    end
    
    test "Deve criar nova entrada" do
        get :new
        assert_response :success
    end
    
    test "Deve funcionar a ação de show" do
        get :show
        assert_response :success
    end

end
```
- rodar o teste:
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 7526

# Running:

EEE.....

Finished in 0.068650s, 116.5326 runs/s, 72.8329 assertions/s.

  1) Error:
CategoriesControllerTest#test_Deve_retornar_a_lista_de_categorias:
RuntimeError: @controller is nil: make sure you set it in your test's setup method.
    test/controllers/categories_controller_test.rb:5:in `block in <class:CategoriesControllerTest>'


  2) Error:
CategoriesControllerTest#test_Deve_criar_nova_entrada:
RuntimeError: @controller is nil: make sure you set it in your test's setup method.
    test/controllers/categories_controller_test.rb:10:in `block in <class:CategoriesControllerTest>'


  3) Error:
CategoriesControllerTest#test_Deve_funcionar_a_ação_de_show:
RuntimeError: @controller is nil: make sure you set it in your test's setup method.
    test/controllers/categories_controller_test.rb:15:in `block in <class:CategoriesControllerTest>'

8 runs, 5 assertions, 0 failures, 3 errors, 0 skips
```
- A partir do output podemos notar que falta o controller
- Em app > controllers > categories_controller.rb
```ruby 
class CategoriesController < ApplicationController
    
end
```
- Rodar o teste
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 11907

# Running:

EEE.....

Finished in 0.137674s, 58.1082 runs/s, 36.3176 assertions/s.

  1) Error:
CategoriesControllerTest#test_Deve_criar_nova_entrada:
ActionController::UrlGenerationError: No route matches {:action=>"new", :controller=>"categories"}
    test/controllers/categories_controller_test.rb:10:in `block in <class:CategoriesControllerTest>'


  2) Error:
CategoriesControllerTest#test_Deve_funcionar_a_ação_de_show:
ActionController::UrlGenerationError: No route matches {:action=>"show", :controller=>"categories"}
    test/controllers/categories_controller_test.rb:15:in `block in <class:CategoriesControllerTest>'


  3) Error:
CategoriesControllerTest#test_Deve_retornar_a_lista_de_categorias:
ActionController::UrlGenerationError: No route matches {:action=>"index", :controller=>"categories"}
    test/controllers/categories_controller_test.rb:5:in `block in <class:CategoriesControllerTest>'

8 runs, 5 assertions, 0 failures, 3 errors, 0 skips
```
- Agora podemos ver que faltam as rotas
- No routes.rb disponibilizar todos as verbos do categories menos o destroy
```ruby
  resources :categories, except: [:destroy]
  ```
  - Rodar o teste
 ```bash
 kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 49727

# Running:

EEE.....

Finished in 0.157657s, 50.7432 runs/s, 31.7145 assertions/s.

  1) Error:
CategoriesControllerTest#test_Deve_funcionar_a_ação_de_show:
ActionController::UrlGenerationError: No route matches {:action=>"show", :controller=>"categories"}
    test/controllers/categories_controller_test.rb:15:in `block in <class:CategoriesControllerTest>'


  2) Error:
CategoriesControllerTest#test_Deve_retornar_a_lista_de_categorias:
AbstractController::ActionNotFound: The action 'index' could not be found for CategoriesController
    test/controllers/categories_controller_test.rb:5:in `block in <class:CategoriesControllerTest>'


  3) Error:
CategoriesControllerTest#test_Deve_criar_nova_entrada:
AbstractController::ActionNotFound: The action 'new' could not be found for CategoriesController
    test/controllers/categories_controller_test.rb:10:in `block in <class:CategoriesControllerTest>'

8 runs, 5 assertions, 0 failures, 3 errors, 0 skips
```
- Agora podemos notar que faltam as ações no controller
- No categories_controller.rb
```ruby
class CategoriesController < ApplicationController
    
    def index
        
    end
    
    def new
    
    end
    
    def show
        
    end
end
```
- Rodar o teste
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 47117

# Running:

EEE.....

Finished in 0.149110s, 53.6516 runs/s, 33.5322 assertions/s.

  1) Error:
CategoriesControllerTest#test_Deve_criar_nova_entrada:
ActionView::MissingTemplate: Missing template categories/new, application/new with {:locale=>[:en], :formats=>[:html], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby, :coffee, :jbuilder]}. Searched in:
  * "/home/ubuntu/workspace/app/views"

    test/controllers/categories_controller_test.rb:10:in `block in <class:CategoriesControllerTest>'


  2) Error:
CategoriesControllerTest#test_Deve_funcionar_a_ação_de_show:
ActionController::UrlGenerationError: No route matches {:action=>"show", :controller=>"categories"}
    test/controllers/categories_controller_test.rb:15:in `block in <class:CategoriesControllerTest>'


  3) Error:
CategoriesControllerTest#test_Deve_retornar_a_lista_de_categorias:
ActionView::MissingTemplate: Missing template categories/index, application/index with {:locale=>[:en], :formats=>[:html], :variants=>[], :handlers=>[:erb, :builder, :raw, :ruby, :coffee, :jbuilder]}. Searched in:
  * "/home/ubuntu/workspace/app/views"

    test/controllers/categories_controller_test.rb:5:in `block in <class:CategoriesControllerTest>'

8 runs, 5 assertions, 0 failures, 3 errors, 0 skips
```
- Aqui notamos que agora faltam os templates, exceto a ação show que precisaria do id da catogoria exibida, por enquanto dar pass
- Criar os templates, em views > categories > new.html.erb, index.html.erb, show.html.erb
- Rodar o teste
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 4337

# Running:

......E.

Finished in 0.427639s, 18.7074 runs/s, 16.3689 assertions/s.

  1) Error:
CategoriesControllerTest#test_Deve_funcionar_a_ação_de_show:
ActionController::UrlGenerationError: No route matches {:action=>"show", :controller=>"categories"}
    test/controllers/categories_controller_test.rb:15:in `block in <class:CategoriesControllerTest>'

8 runs, 7 assertions, 0 failures, 1 errors, 0 skips
```
- Como esperado sobrou só o erro da rota show, vamos usar o método setup
```ruby
class CategoriesControllerTest < ActionController::TestCase
    def setup
        @category = Category.create(name: "sports")
    end
```
- Modificar o teste do controller:
```ruby
    
    test "Deve funcionar a ação de show" do
        get(:show, {'id' => @category.id})
        assert_response :success
    end
```
- Rodar o teste
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 27686

# Running:

........

Finished in 0.364403s, 21.9537 runs/s, 21.9537 assertions/s.

8 runs, 8 assertions, 0 failures, 0 errors, 0 skips
```
### Criando testes de integração:
- Em test > integration > create_categories_test.rb
```ruby
require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
    
    test "recuperar o formulario de nova categoria e criar uma nova categoria" do
        get new_category_path
        assert_template 'categories/new'
    end
    
    
end
```
- Rodar o teste
```bash
kentarofujiy:~/workspace (master) $ rake test
Run options: --seed 47487

# Running:

.........

Finished in 0.522523s, 17.2241 runs/s, 17.2241 assertions/s.

9 runs, 9 assertions, 0 failures, 0 errors, 0 skips
```
- Para certificar que podemos criar uma categoria:
```ruby





