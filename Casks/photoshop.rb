cask :v1 => 'photoshop' do
  module Utils
    def self.name
      'Adobe Photoshop CC 2014'
    end
    def self.install_locale
      'en_US'
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/PHSP/15/osx10/Photoshop_15_LS20.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/photoshop.html'
  version '15.0.0'
  sha256 '08bcdf4f3cb7f438310951fc066734c5f4ac886623aa6dbcad0cd268b0cf6faf'
  installer :script => "#{Utils.name}/Install.app/Contents/MacOS/Install",
            :args => ['--mode=silent', "--deploymentFile=/usr/local/Caskroom/photoshop/15.0.0/#{Utils.name}/Deployment/#{Utils.install_locale}_Deployment.xml"]

  uninstall :script => "#{Utils.name}/Install.app/Contents/MacOS/Install",
            :args => ['--mode=silent', "--action=uninstall", "--deploymentFile=/usr/local/Caskroom/photoshop/15.0.0/#{Utils.name}/Deployment/#{Utils.install_locale}_Deployment.xml"]

  caveats 'You will need to quit all Adobe applications as well as all browsers for the install to succeed!'
end
