default['nut']['mode'] = 'standalone'
default['nut']['manage_serialups.rules'] = false
default['nut']['ups'] = {
  'apc' => {
    'driver' => 'usbhid-ups',
    'port' => 'auto',
    'desc' => 'APC Back-UPS BE550G'
  }
}
