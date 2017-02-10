require 'opengl'
require 'glu'
require 'gosu'

Dir["objects/*"].each {|file| require_relative file }

include Gl, Glu

class Window < Gosu::Window

  attr_accessor :scene_objects

  def initialize
    super 800, 600
    self.caption = "Diatom's OpenGL Tutorial"
    @camera = Camera.new(self)
    @scene_objects = []
  end

  def update
  end

  def draw
    gl do
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

      # TO DO: WRAP OBJECTS INTO ARRAY AND CALL .DRAW TO EVERY OBJECT

      glMatrixMode(GL_PROJECTION)
    	glLoadIdentity()
    	gluPerspective(90, width.to_f/height, 0, 500)
    	glMatrixMode(GL_MODELVIEW)
    	glLoadIdentity()
      @camera.capture

      @scene_objects << Axis.new(100, 100, 100)
      @scene_objects << Cube.new(50, 50, 50, GL_FRONT_AND_BACK, GL_FILL)

      glPushMatrix
        glTranslated(width/2, height/2, 0)
        @scene_objects.each do |object|
          object.draw
        end
      glPopMatrix
      Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_LINE, @camera.look_at_object_position.x, @camera.look_at_object_position.y, @camera.look_at_object_position.z)

      # @scene_objects << Cube.new(50, 50, 50, GL_FRONT_AND_BACK, GL_FILL)

      # Axis.draw(100, 100, 100, true)

    end
  end

  def button_down(id)
    exit if id == Gosu::KbEscape
    add_cube if id == Gosu::KbSpace
  end

  def add_cube
    @scene_objects << Cube.new(
      50, 50, 50,
      GL_FRONT_AND_BACK, GL_FILL,
      @camera.look_at_object_position.x - width/2, @camera.look_at_object_position.y - height/2, @camera.look_at_object_position.z
    )
  end

end


Window.new.show
