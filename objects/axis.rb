class Axis
  attr_reader :x_width, :y_width, :z_width, :stipple

  def initialize(x_width, y_width, z_width, stipple = false)
    @x_width = x_width
    @y_width = y_width
    @z_width = z_width
    @stipple = stipple
  end

  def self.draw(x_width, y_width, z_width, stipple = false)
    object = new(x_width, y_width, z_width, stipple)
    object.draw
  end

  def draw
    if stipple
      glEnable(GL_LINE_STIPPLE)
      glLineStipple(2,0x00FF)
    end
    glBegin(GL_LINES)
      glColor3d(1, 0, 0)
      glVertex3d(0, 0, 0)
      glVertex3d(x_width, 0, 0)
      glColor3d(0, 1, 0)
      glVertex3d(0, 0, 0)
      glVertex3d(0, y_width, 0)
      glColor3d(0, 0, 1)
      glVertex3d(0, 0, 0) 
      glVertex3d(0, 0, z_width)
    glEnd
    glDisable(GL_LINE_STIPPLE) if stipple
  end
end
