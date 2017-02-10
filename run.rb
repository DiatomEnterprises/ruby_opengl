require 'opengl'
require 'glu'
require 'gosu'

Dir["objects/*"].each {|file| require_relative file }

include Gl, Glu

class Window < Gosu::Window

  def initialize
    super 800, 600
    self.caption = "Diatom's OpenGL Tutorial"
    @camera = Camera.new(self)
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

      glPushMatrix
        glTranslated(width/2, height/2, 0)
        Axis.draw(100, 100, 100)
        Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_FILL)
        # puts "#{@camera.look_at_object_position.x} #{@camera.look_at_object_position.y} #{@camera.look_at_object_position.z}"
      glPopMatrix
      Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_LINE, @camera.look_at_object_position.x, @camera.look_at_object_position.y, @camera.look_at_object_position.z)



      Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_FILL)

      Axis.draw(100, 100, 100, true)

    end
  end

  def button_down(id)
    exit if id == Gosu::KbEscape
  end

end


Window.new.show
