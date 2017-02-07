require 'opengl'
require 'glu'
require 'gosu'
include Gl, Glu

class Window < Gosu::Window

  def initialize
    super 800, 600
    self.caption = "Diatom's OpenGL Tutorial"
  end

  def update
  end

  def draw
  end

  def button_down(id)
    exit if id == Gosu::KbEscape
  end
end

Window.new.show
