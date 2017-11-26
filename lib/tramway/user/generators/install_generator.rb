require 'rails/generators'

module Tramway::User::Generators
  class InstallGenerator < ::Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    desc 'Add the migrations for User'

    def run_another_generators
      generate 'tramway:core:install'
    end

    def copy_migrations
      migration_template 'create_users.rb', 'db/migrate/create_users.rb'
    end
  end
end
