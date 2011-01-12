begin
  options = YAML.load_file("#{Rails.root}/config/s3.yml")[RAILS_ENV] || {}
rescue Errno::ENOENT
  options = ENV.to_hash
ensure
  S3Options ||= options.symbolize_keys
end