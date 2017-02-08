require 'pry'
class Cube
  attr_reader :x_width, :y_width, :z_width, :mode, :mode_face

  def initialize(x_width, y_width, z_width, mode_face, mode)
    @x_width = x_width
    @y_width = y_width
    @z_width = z_width
    @mode = mode
    @mode_face = mode_face
  end

  def self.draw(x_width, y_width, z_width, mode_face = GL_FRONT_AND_BACK, mode = GL_FILL)
    object = new(x_width, y_width, z_width, mode_face, mode)
    object.draw
  end

  def draw
    glPolygonMode(mode_face, mode);
    glBegin(GL_QUADS)
      #yx
      glColor3d(1, 0, 0)
      glVertex3d(0, 0, 0)
      glVertex3d(x_width, 0, 0)
      glVertex3d(x_width, y_width, 0)
      glVertex3d(0, y_width, 0)
      #yz
      glColor3d(0, 1, 0)
      glVertex3d(0, y_width, 0)
      glVertex3d(0, 0, 0)
      glVertex3d(0, 0, z_width)
      glVertex3d(0, y_width, z_width)
      #zx
      glColor3d(0, 0, 1)
      glVertex3d(0, 0, z_width)
      glVertex3d(0, 0, 0)
      glVertex3d(x_width, 0, 0)
      glVertex3d(x_width, 0, z_width)
      #z -> yx
      glColor3d(1, 0, 0)
      glVertex3d(0, 0, z_width)
      glVertex3d(x_width, 0, z_width)
      glVertex3d(x_width, y_width, z_width)
      glVertex3d(0, y_width, z_width)
      #x -> yz
      glColor3d(0, 1, 0)
      glVertex3d(x_width, y_width, 0)
      glVertex3d(x_width, 0, 0)
      glVertex3d(x_width, 0, z_width)
      glVertex3d(x_width, y_width, z_width)
      #y -> zx
      glColor3d(0, 0, 1)
      glVertex3d(0, y_width, z_width)
      glVertex3d(0, y_width, 0)
      glVertex3d(x_width, y_width, 0)
      glVertex3d(x_width, y_width, z_width)
    glEnd
  end
end
