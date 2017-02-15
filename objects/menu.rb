class Menu
  attr_accessor :choosen_texture, :window
  TEXTURES = Dir["media/textures/*"]
  def initialize(window)
    @window = window
    @choosen_texture = TEXTURES.first
  end

  def draw
    font = Gosu::Font.new(window, Gosu::default_font_name, 20)

    string_list = TEXTURES.map do |texture|
      extn = File.extname  texture        # => ".mp4"
      name = File.basename texture, extn  # => "xyz"
      name += " (*)" if texture == choosen_texture
      name
    end
    font.draw("Avaliable materials: #{string_list.join(' ;')}", 10, window.height - 20, 3.0, 1.0, 1.0, 0xffffffff)
  end

  def switch_texture
    new_texture_idx = TEXTURES.index(choosen_texture) + 1
    new_texture_idx = 0 if TEXTURES.count == new_texture_idx
    @choosen_texture = TEXTURES[new_texture_idx]
  end
end
