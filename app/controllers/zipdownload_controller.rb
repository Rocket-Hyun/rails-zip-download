class ZipdownloadController < ApplicationController
  def index
    compressed_filestream = Zip::OutputStream.write_buffer(::StringIO.new('')) do |zos|
      folder = "#{Rails.root}/public/data"
      file_list = Dir.entries("public/data/").select {|f| !File.directory? f}
      file_list.each do |text|
        zos.put_next_entry(text)
        zos.print IO.read(File.join(folder, "#{item}.mp3"))
      end
    end
    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: "test.zip"
  end
end
