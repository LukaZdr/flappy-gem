require 'ruby2d'

class Background
  WIDTH = 1000
  HEIGHT = 500
  def initialize
    @image1 = Image.new(
      'assets/background.png',
      height: 500, width: WIDTH,
      x: 0
    )
    @image2 = Image.new(
      'assets/background.png',
      height: 500, width: WIDTH,
      x: WIDTH
    )
    @image3 = Image.new(
      'assets/background.png',
      height: 500, width: WIDTH,
      x: WIDTH*2
    )
  end

  def move
    @image1.x -= 1
    @image2.x -= 1
    @image3.x -= 1
    if @image1.x + WIDTH == 0
      @image1.x += WIDTH*2
    end
    if @image2.x + WIDTH == 0
      @image2.x += WIDTH*2
    end
    if @image3.x + WIDTH == 0
      @image3.x += WIDTH*2
    end
  end
end