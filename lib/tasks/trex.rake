namespace :trex do
  task :upload => :environment do
    gl = Trex::Globalize.new
    gl.upload_translations
  end
end

