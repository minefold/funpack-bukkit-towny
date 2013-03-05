class Templates
  def initialize(base, settings)
    @base = base
    @settings = settings
  end

  def create(files, options={})
    files.each do |src, dest|
      `mkdir -p #{File.dirname(dest)}`
      if options[:overwrite] || !File.exist?(dest)
        File.write(dest, @settings.erb(File.read("#{@base}/templates/#{src}")))
      end
    end
  end
end