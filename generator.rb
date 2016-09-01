require "psych"
require "fileutils"


class Directory
  DATA = Psych.load_file("file_content.yaml")

  def initialize(name)
    @app_name = FileUtils::mkdir(name)
  end

  def generate
    FileUtils::cd(app_name.first)

    create_root_dir_files
    create_sub_folders
  end

  def create_root_dir_files
    DATA['root_dir_files'].each do |file| 
      file.each { |file, _| FileUtils::touch(file) }
    end
  end

  def create_sub_folders
    DATA['sub_dirs'].keys.each { |folder| FileUtils::mkdir(folder) }
  end

  def generate_root_dir_files_content

  end

  def generate_sub_folders_content

  end

  private

    attr_accessor :app_name
end

Directory.new('').generate


