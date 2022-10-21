pkgname=discord-latest
_pkgname=Discord
pkgver=0.0.21
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com'
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3')
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/0.0.21/discord-0.0.21.tar.gz"
        'LICENSE.html::https://discordapp.com/terms'
        'OSS-LICENSES.html::https://discordapp.com/licenses')

prepare() {
  cd $_pkgname

  sed -i "s|Exec=.*|Exec=/usr/bin/discord|" discord.desktop
  echo 'Path=/usr/bin' >> discord.desktop
}

package() {
  # Install the app
  install -d "$pkgdir"/opt/discord
  cp -a $_pkgname/. "$pkgdir"/opt/discord

  chmod 755 "$pkgdir"/opt/discord/$_pkgname

  rm "$pkgdir"/opt/discord/postinst.sh

  install -d "$pkgdir"/usr/{bin,share/{pixmaps,applications}}
  ln -s /opt/discord/$_pkgname "$pkgdir"/usr/bin/discord
  ln -s /opt/discord/discord.png "$pkgdir"/usr/share/pixmaps/discord.png
  ln -s /opt/discord/discord.desktop "$pkgdir"/usr/share/applications/discord.desktop

  # setuid on chrome-sandbox
  chmod u+s "$pkgdir"/opt/discord/chrome-sandbox

  # Licenses
  install -Dm 644 LICENSE.html "$pkgdir"/usr/share/licenses/discord/LICENSE.html
  install -Dm 644 OSS-LICENSES.html "$pkgdir"/usr/share/licenses/discord/OSS-LICENSES.html
}
