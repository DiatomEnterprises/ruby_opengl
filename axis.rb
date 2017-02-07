class Axis
  attr_reader :x_width, :y_width, :z_width

  def initialize(x_width, y_width, z_width)
    @x_width = x_width
    @y_width = y_width
    @z_width = z_width
  end

  def self.draw(x_width, y_width, z_width)
    object = new(x_width, y_width, z_width)
    object.draw
  end

  def draw
    glBegin(GL_LINES)
      glColor3d(1, 0, 0)     #красный цвет
      glVertex3d(0, 0, 0) #первая линия
      glVertex3d(x_width, 0, 0)
      glColor3d(0, 1, 0)     #зеленый
      glVertex3d(0, 0, 0) #вторая линия
      glVertex3d(0, y_width, 0)
      glColor3d(0, 0, 1)     #blue
      glVertex3d(0, 0, 0) #3 линия
      glVertex3d(0, 0, z_width)
    glEnd
  end
end
