class Camera
  attr_reader :camera_position, :look_at_object_position, :window, :speed

  def initialize(window)
    @window = window
    @camera_position = Vector3.new(400, 400, 400)
    @look_at_object_position = Vector3.new(0, 0, 0)
    @speed = 10
  end

  def capture
    font = Gosu::Font.new(window, Gosu::default_font_name, 20)
    button_down
    font.draw("Camera position: #{camera_position.x}:#{camera_position.y}:#{camera_position.z}", 10, 10, 3.0, 1.0, 1.0, 0xffffffff)
    font.draw("Look at position: #{look_at_object_position.x}:#{look_at_object_position.y}:#{look_at_object_position.z}", 10, 25, 3.0, 1.0, 1.0, 0xffffffff)
    font.draw("Your speed: #{speed}", 10, 40, 3.0, 1.0, 1.0, 0xffffffff)
    gluLookAt(camera_position.x, camera_position.y, camera_position.z, look_at_object_position.x, look_at_object_position.y, look_at_object_position.z, 0, 1, 0)
  end

  def button_down
    check_speed
    case
    when Gosu::button_down?(Gosu::KbD)
      @camera_position.x += speed
      @look_at_object_position.x += speed
    when Gosu::button_down?(Gosu::KbA)
      @camera_position.x -= speed
      @look_at_object_position.x -= speed
    when Gosu::button_down?(Gosu::KbW)
      @camera_position.z -= speed
      @look_at_object_position.z -= speed
    when Gosu::button_down?(Gosu::KbS)
      @camera_position.z += speed
      @look_at_object_position.z += speed
    when Gosu::button_down?(Gosu::KbUp)
      @look_at_object_position.y += speed
    when Gosu::button_down?(Gosu::KbDown)
      @look_at_object_position.y -= speed
    when Gosu::button_down?(Gosu::KbRight)
      @look_at_object_position.x += speed
    when Gosu::button_down?(Gosu::KbLeft)
      @look_at_object_position.x -= speed
    when Gosu::button_down?(Gosu::KB_NUMPAD_4)
      @look_at_object_position.z += speed
    when Gosu::button_down?(Gosu::KB_NUMPAD_6)
      @look_at_object_position.z -= speed
    end
    # @camera_position.x += 10 if Gosu::button_down?(Gosu::KbRight) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @camera_position.x -= 10 if Gosu::button_down?(Gosu::KbLeft) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @camera_position.y += 10 if Gosu::button_down?(Gosu::KbUp) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @camera_position.y -= 10 if Gosu::button_down?(Gosu::KbDown) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @camera_position.z += 10 if Gosu::button_down?(Gosu::KB_NUMPAD_8) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @camera_position.z -= 10 if Gosu::button_down?(Gosu::KB_NUMPAD_2) && !Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    #
    # @look_at_object_position.x += 10 if Gosu::button_down?(Gosu::KbRight) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @look_at_object_position.x -= 10 if Gosu::button_down?(Gosu::KbLeft) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @look_at_object_position.y += 10 if Gosu::button_down?(Gosu::KbUp) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @look_at_object_position.y -= 10 if Gosu::button_down?(Gosu::KbDown) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @look_at_object_position.z += 10 if Gosu::button_down?(Gosu::KB_NUMPAD_8) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
    # @look_at_object_position.z -= 10 if Gosu::button_down?(Gosu::KB_NUMPAD_2) && Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
  end

  def check_speed
    @speed = 10
    @speed = 20 if Gosu::button_down?(Gosu::KB_LEFT_SHIFT)
  end
end
