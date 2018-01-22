class ZipdownloadController < ApplicationController
  def index
    compressed_filestream = Zip::OutputStream.write_buffer(::StringIO.new(''), Zip::TraditionalEncrypter.new('password')) do |zos|
      file_list = Dir.entries("public/data/").select {|f| !File.directory? f}
      file_list.each do |text|
        zos.put_next_entry text
      end
    end
    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "test.zip"
  end
end
