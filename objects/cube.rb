require 'pry'
class Cube
  attr_reader :position, :x_width, :y_width, :z_width, :mode, :mode_face, :texture

  def initialize(x_width, y_width, z_width, mode_face, mode, x = 0, y = 0, z = 0, texture = nil)
    @x_width = x_width
    @y_width = y_width
    @z_width = z_width
    @mode = mode
    @mode_face = mode_face
    @position = Vector3.new(x, y, z)
    @texture = texture
  end

  def self.draw(x_width, y_width, z_width, mode_face = GL_FRONT_AND_BACK, mode = GL_FILL, x = 0, y = 0, z = 0, texture = nil)
    object = new(x_width, y_width, z_width, mode_face, mode, x, y, z, texture)
    object.draw
  end

  def draw
    glPolygonMode(mode_face, mode);
    if texture
      texture_info = texture.info
      glEnable(GL_TEXTURE_2D) # enables two-dimensional texturing to perform
      glBindTexture(GL_TEXTURE_2D, texture_info.tex_name) # bing named texture to a target
      # glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR) #linear filter when image is larger than actual texture
      # glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR) #linear filter when image is smaller than actual texture
      glPixelStorei(GL_UNPACK_ALIGNMENT,1)

      draw_textured_cube
      glDisable(GL_TEXTURE_2D)
    else
      draw_rgb_cube
    end
  end

  def draw_textured_cube
    glBegin(GL_QUADS)
    #yx
    glTexCoord2d(0,0); glVertex3d(position.x, position.y, position.z)
    glTexCoord2d(1,0); glVertex3d(x_width + position.x, position.y, position.z)
    glTexCoord2d(1,1); glVertex3d(x_width + position.x, y_width + position.y, position.z)
    glTexCoord2d(0,1); glVertex3d(position.x, y_width + position.y, position.z)
    #yz
    glTexCoord2d(1,0); glVertex3d(position.x, y_width + position.y, position.z)
    glTexCoord2d(1,1); glVertex3d(position.x, position.y, position.z)
    glTexCoord2d(0,1); glVertex3d(position.x, position.y, z_width + position.z)
    glTexCoord2d(0,0); glVertex3d(position.x, y_width + position.y, z_width + position.z)
    #zx
    glVertex3d(position.x, position.y, z_width + position.z)
    glVertex3d(position.x, position.y, position.z)
    glVertex3d(x_width + position.x, position.y, position.z)
    glVertex3d(x_width + position.x, position.y, z_width + position.z)
    #z -> yx
    glTexCoord2d(0,0); glVertex3d(position.x, position.y, z_width + position.z)
    glTexCoord2d(1,0); glVertex3d(x_width + position.x, position.y, z_width + position.z)
    glTexCoord2d(1,1); glVertex3d(x_width + position.x, y_width + position.y, z_width + position.z)
    glTexCoord2d(0,1); glVertex3d(position.x, y_width + position.y, z_width + position.z)
    #x -> yz
    glTexCoord2d(1,1); glVertex3d(x_width + position.x, y_width + position.y, position.z)
    glTexCoord2d(1,0); glVertex3d(x_width + position.x, position.y, position.z)
    glTexCoord2d(0,0); glVertex3d(x_width + position.x, position.y, z_width + position.z)
    glTexCoord2d(0,1); glVertex3d(x_width + position.x, y_width + position.y, z_width + position.z)
    #y -> zx
    glVertex3d(position.x, y_width + position.y, z_width + position.z)
    glVertex3d(position.x, y_width + position.y, position.z)
    glVertex3d(x_width + position.x, y_width + position.y, position.z)
    glVertex3d(x_width + position.x, y_width + position.y, z_width + position.z)
    glEnd
  end

  def draw_rgb_cube
    glColorMaterial(GL_FRONT, GL_DIFFUSE);
    glEnable(GL_COLOR_MATERIAL);
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


    glColor3d(1, 1, 1) #return back primary color
    glEnd
    glDisable(GL_COLOR_MATERIAL);
  end
end
