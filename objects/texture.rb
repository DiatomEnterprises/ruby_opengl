class Texture
  attr_accessor :info
  def initialize(window, filepath)
    @image = Gosu::Image.new(window, filepath, {tileable: true, retro: false})
    @info = @image.gl_tex_info
    # gl_tex_info can return nil if the image was too large to fit onto
    # a single OpenGL texture and was internally split up.
  end
end
