## detect faces

require 'opencv'

if ARGV.size < 2
  STDERR.puts " % ruby #{$0} input.jpg output.jpg"
  exit 1
end

input_filename = ARGV.shift
output_filename = ARGV.shift

image = OpenCV::IplImage::load input_filename
haar_xml_file = File.expand_path File.dirname(__FILE__), 'haarcascade_frontalface_default.xml'
detector = OpenCV::CvHaarClassifierCascade::load haar_xml_file

detector.detect_objects(image).each do |rect|
  puts "detect!! : #{rect.top_left}, #{rect.top_right}, #{rect.bottom_left}, #{rect.bottom_right}"
  image.rectangle! rect.top_left, rect.bottom_right, :color => OpenCV::CvColor::Red
end

image.save output_filename
