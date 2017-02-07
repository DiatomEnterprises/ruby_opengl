require 'opengl'
require 'glu'
require 'gosu'
require 'pry'

require_relative 'axis'
include Gl, Glu

class Window < Gosu::Window

  def initialize
    super 800, 600
    self.caption = "Diatom's OpenGL Tutorial"
  end

  def update
  end

  def draw
    gl do
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)

      glPushMatrix
        glTranslated(width/2, height/2, 0)
        Axis.draw(100, 100, 100)
      glPopMatrix

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
