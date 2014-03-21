class osx_management::add_local_user {
  # Use the correct password hash based on OS X version
  # Each hash is a password of 'puppet'
  $password = $macosx_productversion_major ? {
    '10.7' => 'bd21ecea1ab32f28401ad8124fa032b041db266c4ae5fd86d0f8b9a8da603dc7e49ae58a50b31c509882f01195d565e8e7ee67a10f0259244965a11e991e840849d7fdfb',
    '10.8' => 'b876573f7c16c2e6ff541b7b41e4749daff39da335c76f0348ad8820aab8aa0ce1eb2e8b11c8b0fd801025e601832c3040a25ea1dc0cc532496919d8c601da71c4780d056a7c1fe0cc073ee70b1c9bead9282feaaa3dcdb8bd981150535f918b096adcdf258ef0f7b56379568e2ca53c98ce9cdd80dc8e8babb4a94132a6cdd7',
    '10.9' => 'b876573f7c16c2e6ff541b7b41e4749daff39da335c76f0348ad8820aab8aa0ce1eb2e8b11c8b0fd801025e601832c3040a25ea1dc0cc532496919d8c601da71c4780d056a7c1fe0cc073ee70b1c9bead9282feaaa3dcdb8bd981150535f918b096adcdf258ef0f7b56379568e2ca53c98ce9cdd80dc8e8babb4a94132a6cdd7',
    default => '000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000EB8B2BDB24EE6148B31D0A07044BB0EF065E824CE53224400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  }
  
  $salt = $macosx_productversion_major ? {
    '10.8'  => 'ae4752864f88f934365109b5ac4e65cf1d0ac8a13b778e5e1a2354e54c320b31',
    '10.9'  => 'ae4752864f88f934365109b5ac4e65cf1d0ac8a13b778e5e1a2354e54c320b31',
    default => undef,
  }

  $iterations = $macosx_productversion_major ? {
    '10.8'  => 25641,
    '10.9'  => 25641,
    default => undef,
  }

  user { 'luser':
    ensure     => 'present',
    comment    => 'Local User',
    gid        => '20',
    home       => '/Users/luser',
    password   => $password,
    salt       => $salt,
    iterations => $iterations,
    shell      => '/bin/bash',
    uid        => '551',
  }
}
