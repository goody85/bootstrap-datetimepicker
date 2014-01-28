require 'bundler/gem_tasks'

require 'git'

REPOSITORY = 'https://github.com/Eonasdan/bootstrap-datetimepicker.git'
NAME = 'bootstrap-datetimepicker'

desc 'Import assets from repository (required: VERSION=x)'
task :import_assets do
  input_files = %w(
    bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css
    bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js
  )

  output_files = %w(
    stylesheets/bootstrap-datetimepicker.css
    javascripts/bootstrap-datetimepicker.js
  )

  assets_path = File.join(File.dirname(__FILE__), 'vendor/assets')
  tmp_path = File.join(File.dirname(__FILE__), 'tmp')

  FileUtils.rm_rf(tmp_path) if File.exists?(tmp_path)
  FileUtils.mkdir(tmp_path)

  g = Git.clone(REPOSITORY, NAME, path: tmp_path)

  abort 'Please provide a version' unless version = ENV['VERSION']

  tag = 'v' + version

  if tag
    begin
      tag = g.tag(tag)
    rescue
      abort "Tag '#{tag}' does not exist"
    end
    g.checkout(tag)
    puts "Tag '#{tag.name}' imported"
  else
    puts 'Master branch imported'
  end

  # Copy files from tmp to vendor/assets
  input_files.each_with_index do |input_file, index|
    input_file = File.join(tmp_path, input_file)
    output_file = File.join(assets_path, output_files[index])

    # Create directory if not exists
    FileUtils.mkdir_p(File.dirname(output_file))
    FileUtils.cp(input_file, output_file)
  end

  # Update version
  version_file = File.join(File.dirname(__FILE__), 'lib/bootstrap/datetimepicker/version.rb')
  text = File.read(version_file).gsub!(/".*"/, "\"#{version}\"")
  File.open(version_file, 'w') do |file|
    file.write(text)
  end
end