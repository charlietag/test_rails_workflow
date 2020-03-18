# README

* Try rails gem
  * https://github.com/geekq/workflow-activerecord
  * https://github.com/geekq/workflow

Things you may want to cover:

* Ruby version
  * 2.6.0

* Rails version
  * 6.0.2.1

* Gems
  * gem 'workflow-activerecord'
  * gem 'pry-rails', :group => :development
  * gem 'bullet', group: 'development'

* Gem workflow persistence with active-record (add column *workflow_state*)
  * Ref. https://guides.rubyonrails.org/active_record_migrations.html
  * Ref. https://github.com/geekq/workflow-activerecord#state-persistence-with-activerecord

    ```bash
    $ bin/rails g migration AddWorkflowStateToBooks workflow_state:string

    $ cat 20200317070321_add_workflow_state_to_books.rb
    class AddWorkflowStateToBooks < ActiveRecord::Migration[6.0]
      def change
        add_column :books, :workflow_state, :string
      end
    end
    ```

* Other used built-in features
  * SJR
  * yarn add jquery
  * test_rails_workflow/app/javascript/packs/application.js

    ```bash
    import "jquery/src/jquery"
    ...
    ```

  * bin/rails g scaffold Book name:string author:string

* Changes
  * https://github.com/charlietag/test_rails_workflow/compare/v0.0.0...master
* ...
