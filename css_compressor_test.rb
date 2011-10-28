require "test/unit"
require './css_compressor'

class CssCompressorTest < Test::Unit::TestCase
  
  COMPRESSED_CSS = "body {\nmargin: 0;\npadding: 0;\n}\n#content {\nmargin: 10px\n}"
  COMPRESSED_CSS2 = "body {\nmargin: 0;\npadding: 0;\n}\n#content {\nmargin: 10px\n}\n#content1         {\nmargin: 110px\n}\n"
  
  COMPRESSED_FILE1 = "./css_files/multiline_css_compressed.css"
  COMPRESSED_FILE2 = "./css_files/multiline_compressed.css"
  COMPRESSED_FILE3 = "./css_files/simple_compressed.css"
  
  def test_multiline_css
    css_compressor = CSSCompressor.new("./css_files/multiline_css.css")
    css_compressor.compress_to(COMPRESSED_FILE1)
    data = get_data COMPRESSED_FILE1
    
    assert_equal(COMPRESSED_CSS, data)
  end
  
  def test_simple
    css_compressor = CSSCompressor.new("./css_files/simple.css")
    css_compressor.compress_to(COMPRESSED_FILE3)
    data = get_data COMPRESSED_FILE3
    
    assert_equal(COMPRESSED_CSS, data)
  end
  
  def test_multiline
    css_compressor = CSSCompressor.new("./css_files/multiline.css")
    css_compressor.compress_to(COMPRESSED_FILE2)
    data = get_data COMPRESSED_FILE2
    
    assert_equal(COMPRESSED_CSS2, data)
  end
  
  def get_data filename
    File.open(filename){|f| f.read}
  end
  
end