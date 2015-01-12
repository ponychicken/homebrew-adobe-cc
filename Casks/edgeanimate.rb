cask :v1 => 'edgeanimate' do
  module Utils
    def self.name
      'Adobe Edge Animate CC 2014'
    end
    def self.install_locale
      'en_US'
    end
    def self.installerPath
      "#{self.name}/Install.app/Contents/MacOS/Install"
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/EDGE/5/osx10/Edge_Animate_5_LS17.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/edgeanimate.html'
  version '5.0.0'
  sha256 'e5ecff6c99a5a0d2999573bb17b034c187184134459af4a815150b20c88f11bb'

  installer :script => "#{Utils.installerPath}",
            :args => ['--mode=silent', "--deploymentFile=#{staged_path}/#{Utils.name}/deploy/#{Utils.install_locale}_deployment.xml"]

  uninstall :script => "#{Utils.installerPath}",
            :args => ['--mode=silent', "--deploymentFile=#{staged_path}/#{Utils.name}/deploy/uninstall.xml"]

  caveats 'You will need to quit all Adobe applications for the install to succeed!'
end
