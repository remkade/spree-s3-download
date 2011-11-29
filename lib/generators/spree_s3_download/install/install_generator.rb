# Thanks to BDQ's spree_pages update
module SpreeS3Download
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path("../../../../", File.dirname(__FILE__))
      
      def add_migrations
        run 'rake railties:install:migrations FROM=spree_s3_download_engine'
      end

      def run_migrations
         res = ask "Would you like to run the migrations now? [Y/n]"
         if res == "" || res.downcase == "y"
           run 'rake db:migrate'
         else
           puts "Skipping rake db:migrate, don't forget to run it!"
         end
      end
      
      def copy_yaml
        copy_file "config/s3.yml.sample", "config/s3.yml"
      end
      
      def copy_initializer
        copy_file 'config/initializers/s3.rb', 'config/initializers/s3.rb'
      end
    end
  end
end