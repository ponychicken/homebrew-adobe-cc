cask :v1 => 'acrobat' do
  module Utils
    def self.name
      'Adobe Acrobat XI'
    end
  end

  url 'http://trials3.adobe.com/AdobeProducts/APRO/11/osx10/AcrobatPro_11_Web_WWMUI.dmg',
      :cookies => {
        'MM_TRIALS' => '1234'
      }

  homepage 'http://www.adobe.com/products/indesign.html'
  version '11.0.0'
  sha256 '577a00361a1c130c25d9dfe7abf9979f85c91fb1bf0cfc4aa68d021b9ff38cc0'
  #sha256 :no_check
  pkg "#{Utils.name}/#{Utils.name} Pro Installer.pkg"

  caveats 'You will need to quit all Adobe applications as well as all browsers for the install to succeed!'
end
