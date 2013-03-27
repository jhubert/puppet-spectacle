# Installs Spectacle into /Applications
#
# Usage:
#
#     include spectacle
class spectacle {
  package { 'spectacle':
    source   => 'https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.8.1.zip',
    provider => 'compressed_app'
  }

  exec { "enable assistive devices":
    command => "osascript -e 'tell application \"System Events\" to set UI elements enabled to true'",
    onlyif => "[ ! -f /private/var/db/.AccessibilityAPIEnabled ]",
    user => root,
    require => Package['spectacle']
  }

}
