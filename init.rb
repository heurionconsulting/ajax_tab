# Include hook code here

require 'application'

ApplicationController.prepend_view_path(File.join(File.dirname(__FILE__), 'assets', 'views'))

ActionView::Base.send :include, Ajaxtab

begin
  require File.dirname(__FILE__) + '/install'
rescue
  raise $! unless RAILS_ENV == 'production'
end