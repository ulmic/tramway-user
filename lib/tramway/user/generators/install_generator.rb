require 'tramway/core/generators/install_generator'

module Tramway::User::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    desc 'Add the migrations for User'

    def run_another_generators
      generate 'tramway:core:install'
    end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migration_template 'create_users.rb', 'db/migrate/create_users.rb'
      inject_into_file 'bin/rails', "include Tramway::User\n", before: :begin
    end

    def copy_initializer
      super
      copy_file "tramway_user.rb", 'config/initializers/tramway_user.rb'
    end
  end
end
