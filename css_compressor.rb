class CSSCompressor
  attr_accessor :filename
  
  def initialize(filename)
    @filename = filename
  end
  
  def compress_to(destination_filename)
    file = File.read(@filename)
    @compressed_css = File.open(destination_filename, 'w')
    
    #Loop through each line and remove blank lines and comments
    file.each_line do |line| 
      if (line.scan("/*").empty?) && line.scan("*/").empty? && (line =~ /\S/)
        @compressed_css << line
      end
    end
    @compressed_css.close
  end
  
end
