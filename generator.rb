require "psych"
require "fileutils"
require 'pry'

class Directory
  DATA = Psych.load_file("file_content.yaml")

  def initialize(name)
    @name = name
  end

  def generate
    create_new_app
    FileUtils::cd(name)

    create_root_dir_files
    create_root_dir_folders
    generate_root_dir_files_content
    generate_root_dir_folders_content
  end

  def create_new_app
    FileUtils::mkdir(name)
  end

  def create_root_dir_files
    DATA['root_dir_files'].each do |file| 
      file.each { |file, _| FileUtils::touch(file) }
    end
  end

  def create_root_dir_folders
    DATA['sub_dirs'].keys.each { |folder| FileUtils::mkdir(folder) }
  end

  def generate_root_dir_files_content
    stored_files = DATA['root_dir_files']

    stored_files.each do |pair|
      pair.each do |file, data|
        if Dir.glob('*').include? file
          current_file = stored_files.delete(file)

          File::write(current_file, generate_content(data))
        end
      end
    end
  end

  def generate_root_dir_folders_content

  end

  private

    attr_reader :name

    def generate_content(data)
      return data if data.class == String
      data.join("\n")
    end
end

Directory.new('').generate


