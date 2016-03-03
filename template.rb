
def apply_template!

  # dev db mysql2-0.4.3
  gem 'mysql2'

  #ui bootstrap
  gem 'bootstrap-sass'

  gem 'activeadmin', github: 'activeadmin'

  #activeadmin dependencies
  #user auth
  gem 'devise'

  #form builder
  gem 'formtastic'

  #pagination
  gem 'kaminari'

  #simple search
  gem 'ransack'
  #end activeadmin dependencies

  #authorization
  gem 'cancancan'

  # Use active_admin_import for csv import - https://github.com/activeadmin-plugins/active_admin_import
  gem "active_admin_import" , github: "Fivell/active_admin_import"

  # use active record store to prevent cookie overflow issue when importing
  # https://github.com/rails/activerecord-session_store
  gem 'activerecord-session_store'

  #seeder for db
  gem 'faker'

  #inline edit
  gem 'best_in_place'





  generate("active_admin:install")



end

after_bundle do

  rake("db:migrate")

end

apply_template!