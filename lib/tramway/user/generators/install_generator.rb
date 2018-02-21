require 'rails/generators'
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
      migration_template 'create_tramway_user_users.rb', 'db/migrate/create_tramway_user_users.rb'
    end
  end
end
