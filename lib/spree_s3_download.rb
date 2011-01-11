require 'spree_core'
require 'spree_s3_download_hooks'

# Register the s3 extension module for product class to have a clean activation of it.
module ProductS3Extension
  def self.included(base)
    base.has_many :s3_products
  end
end


module SpreeS3Download
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? reqire(c) : load(c)
      end  
    
       Product.send(:include, ProductS3Extension)

        User.class_eval do
          def purchased_products
            orders.completed.map{|o| o.line_items.map{|l| l.variant.product}}.flatten
          end

          def s3_products
            purchased_products.select{|p| !p.s3_products.empty?}
          end
        end

        Order.class_eval do
          scope :completed, includes(:line_items => {:variant => :product}).order('created_at desc')     
           # :conditions => {:status => Order::Status::PAID}, We're going to trust the user here.

          scope :completed_bare, where(:status => :checkout_complete).
            order('created_at desc')
         
        end  
      
        Admin::ProductsController.class_eval do 
          before_filter :add_s3_product_admin_tab

          def add_s3_product_admin_tab
            @product_admin_tabs << {:name => 'S3 Downloadables', :url => 'admin_product_s3_products_url'}
          end
        end
      
    end

    config.to_prepare &method(:activate).to_proc
  end
end
