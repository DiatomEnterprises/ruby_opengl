require 'opengl'
require 'glu'
require 'gosu'

Dir["objects/*"].each {|file| require_relative file }

include Gl, Glu

class Window < Gosu::Window

  attr_accessor :scene_objects, :translation, :light, :menu

  def initialize
    super 800, 600
    self.caption = "Diatom's OpenGL Tutorial"
    @camera = Camera.new(self)
    @scene_objects = []
    @translation = Vector3.new(width/2, height/2,0)
    @light = Light.new
    @menu = Menu.new(self)
  end

  def update
  end

  def draw
    gl do
      glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)
      init_lighting
      init_depth
      init_projection
      init_perspective
      @camera.capture
      @menu.draw
      add_translated_axis
      init_room
      glPushMatrix
        glTranslated(translation.x, translation.y, translation.z)
        @scene_objects.each do |object|
          object.draw
        end
      glPopMatrix
      draw_cursor
      draw_zero_axis
    end
  end

  def init_lighting
    light.lumos
  end

  def init_depth
    glEnable(GL_DEPTH_TEST);
    glDepthMask(GL_TRUE);
    glDepthFunc(GL_LEQUAL);
  end

  def init_projection
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
  end

  def init_perspective
    #angle, aspect ration, near, fars
    gluPerspective(90, width.to_f/height, 0.01, 800)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
  end

  def init_room
    texture = Texture.new(self, "media/textures/brick.bmp")
    Cube.draw(800, 400, 800, GL_FRONT_AND_BACK, GL_FILL, 0, 0, 0, texture)
  end

  def button_down(id)
    exit if id == Gosu::KbEscape
    add_cube if id == Gosu::KbSpace
    light.switch_lighting_mode if id == Gosu::KbF
    menu.switch_texture if id == Gosu::KbZ
  end

  def draw_cursor
    Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_LINE, @camera.look_at_object_position.x, @camera.look_at_object_position.y, @camera.look_at_object_position.z)
  end

  def draw_zero_axis
    Cube.draw(50, 50, 50, GL_FRONT_AND_BACK, GL_FILL)
    Axis.draw(100, 100, 100, true)
  end

  def add_translated_axis
    @scene_objects << Axis.new(100, 100, 100)
    @scene_objects << Cube.new(50, 50, 50, GL_FRONT_AND_BACK, GL_FILL)
  end

  def add_cube
    texture = Texture.new(self, menu.choosen_texture)
    @scene_objects << Cube.new(
      50, 50, 50,
      GL_FRONT_AND_BACK, GL_FILL,
      @camera.look_at_object_position.x - translation.x, @camera.look_at_object_position.y - translation.y, @camera.look_at_object_position.z - translation.z,
      texture
    )
  end


end


Window.new.show
