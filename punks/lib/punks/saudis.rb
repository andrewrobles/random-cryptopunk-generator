module Saudi

  class Spritesheet
    def self.builtin
      @builtin ||= Pixelart::Spritesheet.read(  "#{Pixelart::Module::Punks.root}/config/saudis-24x24.png",
                                                "#{Pixelart::Module::Punks.root}/config/saudis-24x24.csv",
                                                width:  24,
                                                height: 24 )
    end

    ## note: for now class used for "namespace" only
    def self.find_by( name: )  ## return archetype/attribute image by name
       builtin.find_by( name: name )
    end
  end  # class Spritesheet
  ## add convenience (alternate spelling) alias - why? why not?
  SpriteSheet = Spritesheet
  Sheet       = Spritesheet
  Sprite      = Spritesheet


  class Image  <  Pixelart::Image
    def self.generator
      @generator ||= Artfactory.use( Saudi::Sheet.builtin,
                                     image_class: Image )
    end
    def self.generate( *names )
      generator.generate( *names )
    end
  end # class Image


end #  module Saudi

