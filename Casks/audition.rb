cask :v1 => 'audition' do
  module Utils
    def self.name
      'Adobe Audition CC 2014'
    end
    def self.install_locale
      'en_US'
    end
    def self.installerPath
      "#{self.name}/Install.app/Contents/MacOS/Install"
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/AUDT/7/osx10-64/Audition_7_LS20.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/audition.html'
  version '7.0.0'
  sha256 'fce1a3c9c6fb3924fec07d2b0150098efd0e1054b9777696486438a50eb11c5e'

  installer :manual => "#{self.name}/Install.app"

  caveats 'You will need to quit all Adobe applications for the install to succeed!'
end
