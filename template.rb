
def apply_template!
  source_paths

  # dev db mysql2-0.4.3
  gem 'mysql2'

#ui bootstrap
  gem 'bootstrap-sass'

  gem 'activeadmin', github: 'activeadmin'

  # activeadmin dependencies
  # authentication
  gem 'devise'

  #forms
  gem 'formtastic'

  #pagination
  gem 'kaminari'

  #search
  gem 'ransack'
  # end activeadmin dependencies

  # user authorization
  gem 'cancancan'

  # db seeder
  gem 'faker'

  # Use DataTables and AjaxDataTables - https://github.com/antillas21/ajax-datatables-rails
  gem 'jquery-datatables-rails', '~> 3.2.0'
  gem 'ajax-datatables-rails'

  # Use active_admin_import for csv import - https://github.com/activeadmin-plugins/active_admin_import
  gem "active_admin_import" , github: "Fivell/active_admin_import"

  # use active record store to prevent cookie overflow issue when importing
  # https://github.com/rails/activerecord-session_store
  gem 'activerecord-session_store'


  remove_files

  copy_files

  run_generators


  after_bundle

end


def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end


def remove_files

  remove_file("app/views/layouts/application.html.erb")

end


def copy_files

  copy_file("app/templates/app_copy_src/views/layouts/application.html.erb", "app/views/layouts/application.html.erb")

end


def run_generators

  generate(:controller, "Home", "index")

  #generate("active_admin:install")

end



def after_bundle

  route "root to: 'home#index'"

  rake("db:migrate")
  #rake("db:seed")

end


apply_template!