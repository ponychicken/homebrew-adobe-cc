cask :v1 => 'indesign' do
  module Utils
    def self.name
      'Adobe InDesign CC 2014'
    end
    def self.install_locale
      'en_US'
    end
    def self.installerPath
      "#{self.name}/Install.app/Contents/MacOS/Install"
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/IDSN/10/osx10/InDesign_10_LS20.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/indesign.html'
  version '10.0.0'
  sha256 'e68cc10ffd2b20a00cb79fd0c0ee5c6422c79383db6de5d81b82d14df76f0ff5'
  installer :script => "#{Utils.installerPath}",
            :args => ['--mode=silent', "--deploymentFile=#{staged_path}/#{Utils.name}/deploy/install.xml"]

  uninstall :script => "#{Utils.installerPath}",
            :args => ['--mode=silent', "--action=uninstall", "--deploymentFile=#{staged_path}/#{Utils.name}/deploy/install.xml"]

  caveats 'You will need to quit all Adobe applications as well as all browsers for the install to succeed!'
end
