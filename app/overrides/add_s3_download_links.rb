Deface::Override.new(:virtual_path => "admin/product_scopes/_form",
  :name => "converted_admin_product_form_meta_612603396",
  :insert_before => "[data-hook='admin_product_form_meta'], #admin_product_form_meta[data-hook]",
  :partial => "admin/products/add_s3_product",
  :disabled => false)

Deface::Override.new(:virtual_path => "admin/shared/_product_tabs",
  :name => "converted_admin_product_tabs_322064036",
  :insert_after => "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
  :text => "
  <li<%== ' class=\"active\"' if current == \"Downloads\" %>>
  <%= link_to \"Downloads\", admin_product_s3_products_path(@product) %>
  </li>",
  :disabled => false)