begin
  options = YAML.load_file("#{Rails.root}/config/s3.yml")[Rails.env] || {}
rescue Errno::ENOENT => e
  raise(Errno::ENOENT, "I can't find #{Rails.root}/config/s3.yml, did you run `rails g spree_s3_download:install` ?")
ensure
  S3Options ||= options.symbolize_keys
end