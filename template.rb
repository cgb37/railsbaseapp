
def apply_template!
  source_paths

  # dev db mysql2-0.4.3
  gem 'mysql2'

  #ui bootstrap
  gem 'bootstrap-sass'

  gem 'activeadmin', github: 'activeadmin/activeadmin'

  # activeadmin dependencies
  # authentication
  gem 'devise'

  #forms
  gem 'formtastic'

  #pagination
  gem 'kaminari'

  #simple search
  gem 'ransack'
  #end activeadmin dependencies

  #authorization
  gem 'cancancan'

  # db seeder
  gem 'faker'

  # Use DataTables and AjaxDataTables - https://github.com/antillas21/ajax-datatables-rails
  gem 'jquery-datatables-rails', '~> 3.2.0'
  gem 'ajax-datatables-rails'


  # Use active_admin_import for csv import - https://github.com/activeadmin-plugins/active_admin_import
  gem 'active_admin_import', github: "activeadmin-plugins/active_admin_import"

  # use active record store to prevent cookie overflow issue when importing
  # https://github.com/rails/activerecord-session_store
  gem 'activerecord-session_store'


  #seeder for db
  gem 'faker'

  #inline edit
  gem 'best_in_place'

  # font icons
  gem 'font-awesome-sass', '~> 4.6.2'


  #callbacks
  bundle_install

  run_generators

  remove_files

  copy_files

  set_routes

  rake_migrations


end



def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def bundle_install
  run 'bundle install'
end

def remove_files
  remove_file('app/assets/stylesheets/application.css')
  remove_file('app/views/layouts/application.html.erb')
end


def copy_files
  copy_file('app/templates/app_copy_src/views/layouts/application.html.erb', 'app/views/layouts/application.html.erb')
  copy_file('app/templates/app_copy_src/views/layouts/_header.html.erb', 'app/views/layouts/_header.html.erb')
  copy_file('app/templates/app_copy_src/views/layouts/_header.html.erb', 'app/views/layouts/_footer.html.erb')
  copy_file('app/templates/app_copy_src/assets/stylesheets/application.scss', 'app/assets/stylesheets/application.scss')
  copy_file('app/templates/app_copy_src/assets/stylesheets/bootstrap-overrides.scss', 'app/assets/stylesheets/bootstrap-overrides.scss')
end


def run_generators
  generate(:controller, 'Home', 'index')
  generate('active_admin:install')
  generate('devise:views')
  generate('kaminari:config')
  generate('kaminari:views', 'bootstrap3')
end


def set_routes
  route "root to: 'home#index'"
end


def rake_migrations
  rake('db:create')
  rake('db:migrate')
  rake('db:seed')
end


apply_template!
