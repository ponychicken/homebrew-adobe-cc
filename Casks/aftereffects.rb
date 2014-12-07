cask :v1 => 'aftereffects' do
  module Utils
    def self.name
      'Adobe After Effects CC 2014'
    end
    def self.install_locale
      'en_US'
    end
    def self.installerPath
      "#{self.name}/Install.app/Contents/MacOS/Install"
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/AEFT/13/osx10-64/AfterEffects_13_LS20.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/aftereffects.html'
  version '13.0.0'
  sha256 '1923a23b35cc0214335c22b2979e2996d05f2814ced23532b67cd7f458cc2bff'

  installer :manual => "#{self.name}/Install.app"

  caveats 'You will need to quit all Adobe applications as well as all browsers for the install to succeed!'
end
