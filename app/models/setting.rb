class Setting < RailsSettings::CachedSettings
  attr_accessible :var
  
  WEB_FONTS = {
    'Sans Serif' => [
      ['Arial', 'Arial, "Helvetica Neue", Helvetica, sans-serif'],
      ['Avant Garde','"Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif'],
      ['Calibri','Calibri, Candara, Segoe, "Segoe UI", Optima, Arial, sans-serif'],
      ['Candara','Candara, Calibri, Segoe, "Segoe UI", Optima, Arial, sans-serif'],
      ['Century Gothic', '"Century Gothic", CenturyGothic, AppleGothic, sans-serif'],
      ['Franklin Gothic Medium', '"Franklin Gothic Medium", "Franklin Gothic", "ITC Franklin Gothic", Arial, sans-serif'],
      ['Futura', 'Futura, "Trebuchet MS", Arial, sans-serif'],
      ['Geneva', 'Geneva, Tahoma, Verdana, sans-serif'],
      ['Gill Sans', '"Gill Sans", "Gill Sans MT", Calibri, sans-serif'],
      ['Helvetica', '"Helvetica Neue", Helvetica, Arial, sans-serif'],
      ['Impact', 'Impact, Haettenschweiler, "Franklin Gothic Bold", Charcoal, "Helvetica Inserat", "Bitstream Vera Sans Bold", "Arial Black", sans serif'],
      ['Lucida Grande', '"Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif'],
      ['Optima', 'Optima, Segoe, "Segoe UI", Candara, Calibri, Arial, sans-serif'],
      ['Segoe UI', '"Segoe UI", Frutiger, "Frutiger Linotype", "Dejavu Sans", "Helvetica Neue", Arial, sans-serif'],
      ['Tahoma', 'Tahoma, Verdana, Segoe, sans-serif'],
      ['Trebuchet MS', '"Trebuchet MS", "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Tahoma, sans-serif'],
      ['Verdana', 'Verdana, Geneva, sans-serif']
    ],
    'Serif' => [
      ['Baskerville', 'Baskerville, "Baskerville Old Face", "Hoefler Text", Garamond, "Times New Roman", serif'],
      ['Big Caslon', '"Big Caslon", "Book Antiqua", "Palatino Linotype", Georgia, serif'],
      ['Bodoni MT', '"Bodoni MT", Didot, "Didot LT STD", "Hoefler Text", Garamond, "Times New Roman", serif'],
      ['Book Antiqua', '"Book Antiqua", Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif'],
      ['Calisto MT', '"Calisto MT", "Bookman Old Style", Bookman, "Goudy Old Style", Garamond, "Hoefler Text", "Bitstream Charter", Georgia, serif'],
      ['Cambria', 'Cambria, Georgia, serif'],
      ['Didot', 'Didot, "Didot LT STD", "Hoefler Text", Garamond, "Times New Roman", serif'],
      ['Garamond', 'Garamond, Baskerville, "Baskerville Old Face", "Hoefler Text", "Times New Roman", serif'],
      ['Georgia', 'Georgia, Times, "Times New Roman", serif'],
      ['Goudy Old Style', '"Goudy Old Style", Garamond, "Big Caslon", "Times New Roman", serif'],
      ['Hoefler Text', '"Hoefler Text", "Baskerville old face", Garamond, "Times New Roman", serif'],
      ['Lucida Bright', '"Lucida Bright", Georgia, serif'],
      ['Palatino', 'Palatino, "Palatino Linotype", "Palatino LT STD", "Book Antiqua", Georgia, serif'],
      ['Perpetua', 'Perpetua, Baskerville, "Big Caslon", "Palatino Linotype", Palatino, "URW Palladio L", "Nimbus Roman No9 L", serif'],
      ['Rockwell', 'Rockwell, "Courier Bold", Courier, Georgia, Times, "Times New Roman", serif'],
      ['Times New Roman', 'TimesNewRoman, "Times New Roman", Times, Baskerville, Georgia, serif']
    ],
    'Monospaced' => [
      ['Andale Mono', '"Andale Mono", AndaleMono, monospace'],
      ['Consolas', 'Consolas, monaco, monospace'],
      ['Courier New', '"Courier New", Courier, "Lucida Sans Typewriter", "Lucida Typewriter", monospace'],
      ['Lucida Console', '"Lucida Console", "Lucida Sans Typewriter", Monaco, "Bitstream Vera Sans Mono", monospace'],
      ['Monaco', 'Monaco, Consolas, "Lucida Console", monospace']
    ]
  }

  
  def self.array_colors
    [self.color1, self.color2, self.color3, self.color4, self.color5]
  end
  
  def self.home_main_content_safe
    self.home_main_content.gsub('\"','"')
  end
  
  def self.text_font_family_name
    Setting::WEB_FONTS.values.flatten(1).select {|font| font.last == self.text_font_family}.flatten.first if self.text_font_family.present?
  end
end
