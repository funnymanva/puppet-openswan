class openswan::service {
  exec { '/etc/init.d/ipsec-redirect':
    user => 'root',
    group => 'root',
  }
  service { $openswan::params::service_name:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => Exec['/etc/init.d/ipsec-redirect'],
  }
}
