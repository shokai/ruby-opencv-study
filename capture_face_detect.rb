## capture with camera and detect faces

require 'opencv'

window = OpenCV::GUI::Window.new "face detect"
capture = OpenCV::CvCapture.open
detector = OpenCV::CvHaarClassifierCascade::load "./haarcascade_frontalface_default.xml"

loop do
  image = capture.query
  image = image.resize OpenCV::CvSize.new 640, 360
  detector.detect_objects(image).each do |rect|
    image.rectangle! rect.top_left, rect.bottom_right, :color => OpenCV::CvColor::Red
  end
  window.show image
  break if OpenCV::GUI::wait_key(100)
end

