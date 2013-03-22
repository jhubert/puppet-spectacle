# Installs Spectacle into /Applications
#
# Usage:
#
#     include spectacle
class spectacle {
  package { 'Spectacle':
    source   => 'https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.8.1.zip',
    provider => 'compressed_app'
  }

  exec { "enable assistive devices":
    command => "echo -n 'a' | tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1; chmod 444 /private/var/db/.AccessibilityAPIEnabled",
    onlyif => "[ ! -f /private/var/db/.AccessibilityAPIEnabled ]",
    user => root
  }

}
