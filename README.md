Indicaciones para poder ejecutar la aplicacion de forma local

	1. Clonar el repositorio de Github localmente
	
	2. Eliminar las lineas siguientes en el archivo Gemfile:
		group :production do
		  gem 'pg'
		end
		
	3. Agregar en el Gemfile lo siguiente:
		gem 'sqlite3'
		
	4. Ejecutar en la consola bundle install
	
	5. Modificar el archivo config/database.yml y cambiar linea 8 por:
		adapter: sqlite3
	
	6. Ejecutar el comando en consola rails db:migrate
	
	7. Ejecutar el comando en consola rails server
	

     Versiones de Software Utilizadas:
	Ruby 2.5.3
	Rails 5.0.7
	Bootstrap 4.1.3
          
