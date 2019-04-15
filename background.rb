require 'ruby2d'

class Background
  def initialize
    @image1 = Image.new(
      'assets/background.png',
      height: 500, width: 1000,
      x: 0
    )
    @image2 = Image.new(
      'assets/background.png',
      height: 500, width: 1000,
      x: 1000
    )
    @image3 = Image.new(
      'assets/background.png',
      height: 500, width: 1000,
      x: 2000
    )
  end

  def move
    @image1.x -= 1
    @image2.x -= 1
    @image3.x -= 1
    if @image1.x + 1000 == 0
      @image1.x += 2000
    end
    if @image2.x + 1000 == 0
      @image2.x += 2000
    end
    if @image3.x + 1000 == 0
      @image3.x += 2000
    end
  end
end