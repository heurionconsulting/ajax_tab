source = File.dirname(__FILE__)
destination = RAILS_ROOT

begin
  FileUtils.mkdir_p(destination + '/public/stylesheets/ajaxtab') unless File.exist?(destination + '/public/stylesheets/ajaxtab')
  FileUtils.mkdir_p(destination + '/public/javascripts/ajaxtab') unless File.exist?(destination + '/public/javascripts/ajaxtab')
  FileUtils.mkdir_p(destination + '/public/images/ajaxtab') unless File.exist?(destination + '/public/images/ajaxtab')
  
  FileUtils.cp_r(Dir.glob(source+'/assets/stylesheets/ajaxtab.css'), destination + '/public/stylesheets/ajaxtab/') unless File.exist?(destination + '/public/stylesheets/ajaxtab/ajaxtab.css')
  FileUtils.cp_r(Dir.glob(source+'/assets/stylesheets/themes.css'), destination + '/public/stylesheets/ajaxtab/') unless File.exist?(destination + '/public/stylesheets/ajaxtab/themes.css')
  FileUtils.cp_r(Dir.glob(source+'/assets/javascripts/ajaxtab.js'), destination + '/public/javascripts/ajaxtab/') unless File.exist?(destination + '/public/javascripts/ajaxtab/ajaxtab.js')
  FileUtils.cp_r(Dir.glob(source+'/assets/images/ajaxtab_loader.gif'), destination + '/public/images/ajaxtab/') unless File.exist?(destination + '/public/images/ajaxtab/ajaxtab_loader.gif')
rescue
  raise "ajaxtab was unable to initialize." unless RAILS_ENV == 'production'
end