require 'pry'
class Cube
  attr_reader :position, :x_width, :y_width, :z_width, :mode, :mode_face

  def initialize(x_width, y_width, z_width, mode_face, mode, x = 0, y = 0, z = 0)
    @x_width = x_width
    @y_width = y_width
    @z_width = z_width
    @mode = mode
    @mode_face = mode_face
    @position = Vector3.new(x, y, z)
  end

  def self.draw(x_width, y_width, z_width, mode_face = GL_FRONT_AND_BACK, mode = GL_FILL, x = 0, y = 0, z = 0)
    object = new(x_width, y_width, z_width, mode_face, mode, x, y, z)
    object.draw
  end

  def draw
    glPolygonMode(mode_face, mode);
    glBegin(GL_QUADS)
      #yx
      glColor3d(1, 0, 0)
      glVertex3d(position.x, position.y, position.z)
      glVertex3d(x_width + position.x, position.y, position.z)
      glVertex3d(x_width + position.x, y_width + position.y, position.z)
      glVertex3d(position.x, y_width + position.y, position.z)
      #yz
      glColor3d(0, 1, 0)
      glVertex3d(position.x, y_width + position.y, position.z)
      glVertex3d(position.x, position.y, position.z)
      glVertex3d(position.x, position.y, z_width + position.z)
      glVertex3d(position.x, y_width + position.y, z_width + position.z)
      #zx
      glColor3d(0, 0, 1)
      glVertex3d(position.x, position.y, z_width + position.z)
      glVertex3d(position.x, position.y, position.z)
      glVertex3d(x_width + position.x, position.y, position.z)
      glVertex3d(x_width + position.x, position.y, z_width + position.z)
      #z -> yx
      glColor3d(1, 0, 0)
      glVertex3d(position.x, position.y, z_width + position.z)
      glVertex3d(x_width + position.x, position.y, z_width + position.z)
      glVertex3d(x_width + position.x, y_width + position.y, z_width + position.z)
      glVertex3d(position.x, y_width + position.y, z_width + position.z)
      #x -> yz
      glColor3d(0, 1, 0)
      glVertex3d(x_width + position.x, y_width + position.y, position.z)
      glVertex3d(x_width + position.x, position.y, position.z)
      glVertex3d(x_width + position.x, position.y, z_width + position.z)
      glVertex3d(x_width + position.x, y_width + position.y, z_width + position.z)
      #y -> zx
      glColor3d(0, 0, 1)
      glVertex3d(position.x, y_width + position.y, z_width + position.z)
      glVertex3d(position.x, y_width + position.y, position.z)
      glVertex3d(x_width + position.x, y_width + position.y, position.z)
      glVertex3d(x_width + position.x, y_width + position.y, z_width + position.z)
    glEnd
  end
end
