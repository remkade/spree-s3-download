class SpreeS3DownloadHooks < Spree::ThemeSupport::HookListener


  insert_before :admin_product_form_meta, "admin/products/add_s3_product"   
  insert_after :admin_product_tabs do
    %Q{
      <li<%== ' class="active"' if current == "Downloads" %>>
      <%= link_to "Downloads", admin_product_s3_products_path(@product) %>
    </li>}
  end

end
