class Camera
  attr_reader :camera_position, :look_at_object_position, :window

  def initialize(window)
    @window = window
    @camera_position = Vector3.new(400, 400, 400)
    @look_at_object_position = Vector3.new(0, 0, 0)
  end

  def capture
    font = Gosu::Font.new(window, Gosu::default_font_name, 20)
    check_keys
    font.draw("Camera position: #{camera_position.x}:#{camera_position.y}:#{camera_position.z}", 10, 10, 3.0, 1.0, 1.0, 0xffffffff)
    font.draw("Look at position: #{look_at_object_position.x}:#{look_at_object_position.y}:#{look_at_object_position.z}", 10, 25, 3.0, 1.0, 1.0, 0xffffffff)
    gluLookAt(camera_position.x, camera_position.y, camera_position.z, look_at_object_position.x, look_at_object_position.y, look_at_object_position.z, 0, 1, 0)
  end

  def check_keys
    @camera_position.x += 10 if Gosu::button_down?(Gosu::KbRight) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @camera_position.x -= 10 if Gosu::button_down?(Gosu::KbLeft) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @camera_position.y += 10 if Gosu::button_down?(Gosu::KbUp) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @camera_position.y -= 10 if Gosu::button_down?(Gosu::KbDown) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @camera_position.z += 10 if Gosu::button_down?(Gosu::KB_NUMPAD_8) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @camera_position.z -= 10 if Gosu::button_down?(Gosu::KB_NUMPAD_2) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)

    @look_at_object_position.x += 10 if Gosu::button_down?(Gosu::KbRight) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @look_at_object_position.x -= 10 if Gosu::button_down?(Gosu::KbLeft) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @look_at_object_position.y += 10 if Gosu::button_down?(Gosu::KbUp) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @look_at_object_position.y -= 10 if Gosu::button_down?(Gosu::KbDown) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @look_at_object_position.z += 10 if Gosu::button_down?(Gosu::KB_NUMPAD_8) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    @look_at_object_position.z -= 10 if Gosu::button_down?(Gosu::KB_NUMPAD_2) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
  end
end
