require "psych"
require "fileutils"


class Directory

DATA = Psych.load_file("file_content.yaml")

  def initialize(name)
    @new_app = FileUtils.mkdir(name)
  end

  def create_root_dir_files
  
  end

  def create_sub_folders

  end

  def generate_root_dir_files_content

  end

  def generate_sub_folders_content
    
  end

  private

    attr_accessor :new_app

end





Directory.new('todos')

