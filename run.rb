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
      # glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

      glMatrixMode(GL_PROJECTION)
    	glLoadIdentity()
    	gluPerspective(130, width.to_f/height, 0, 500)
    	glMatrixMode(GL_MODELVIEW)
    	glLoadIdentity()

      @camera.capture

      glPushMatrix
        glTranslated(width/2, height/2, 0)
        Axis.draw(100, 100, 100)
        Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_LINE)
      glPopMatrix

      Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_LINE)

      glEnable(GL_LINE_STIPPLE)
      glLineStipple(2,0x00FF)
      Axis.draw(100, 100, 100)
      glDisable(GL_LINE_STIPPLE)

    end
  end

  def button_down(id)
    exit if id == Gosu::KbEscape
  end

end


Window.new.show
