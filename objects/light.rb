class Light
  attr_accessor :lighting
  def initialize
    @lighting = 1
  end

  def lumos
    if lighting
      glEnable(GL_LIGHTING)
        glLightfv(GL_LIGHT0, GL_AMBIENT, [0.5, 0.5, 0.5, 1])
        glLightfv(GL_LIGHT0, GL_DIFFUSE, [1, 1, 1, 1])
        glLightfv(GL_LIGHT0, GL_POSITION, [1, 1, 1,1])
        glLightfv(GL_LIGHT1, GL_AMBIENT, [0.5, 0.5, 0.5, 1])
        glLightfv(GL_LIGHT1, GL_DIFFUSE, [1, 1, 1, 1])
        glLightfv(GL_LIGHT1, GL_POSITION, [100, 100, 100,1])
        case lighting
        when 1
          glEnable(GL_LIGHT0)
          glDisable(GL_LIGHT1)
        when 2
          glDisable(GL_LIGHT0)
          glEnable(GL_LIGHT1)
        when 3
          glEnable(GL_LIGHT0)
          glEnable(GL_LIGHT1)
        end
    end
  end

  def switch_lighting_mode
    modes = [nil, 1, 2, 3]
    new_mode_index = modes.index(lighting) + 1
    new_mode_index = 0 if modes.count == new_mode_index
    @lighting = modes[new_mode_index]
  end
end
