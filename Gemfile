source 'https://rubygems.org'

group :development do
  gem 'debugger', :platforms => [:mri_19]
  gem 'byebug', :platforms => [:mri_20, :mri_21]
  gem "yard"
end

group :development, :test do
  gem "rake"
  gem "pry"
end

group :test do
  gem "rspec", '~> 3.0.0.beta1'
  gem "vcr"
  gem "webmock"
  gem 'simplecov', :require => false
end

gem "jruby-openssl" if defined? JRUBY_VERSION

gemspec