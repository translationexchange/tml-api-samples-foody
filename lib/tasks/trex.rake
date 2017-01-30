namespace :trex do
  task :upload => :environment do
    gl = Trex::Apiv2.new("464429b1b370daf735ae0f88cc03361bc94a27fff450ee01196af244c83c1948")
    gl.upload_translations
  end

  task :download => :environment do
    gl = Trex::Apiv2.new("464429b1b370daf735ae0f88cc03361bc94a27fff450ee01196af244c83c1948")
    gl.fetch_translations
  end
end

