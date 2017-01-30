namespace :trex do
  task :upload => :environment do
    gl = Trex::Globalize.new
    gl.upload_translations
  end

  task :download => :environment do
    gl = Trex::Globalize.new
    gl.fetch_translations
  end
end

