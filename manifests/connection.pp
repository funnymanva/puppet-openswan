define openswan::connection(
  $auto              = undef,
  $authby            = undef,
  $esp               = undef,
  $ike               = undef,
  $left              = undef,
  $leftid            = undef,
  $leftsubnet        = undef,
  $leftprotoport     = undef,
  $leftnexthop       = undef,
  $pfs               = undef,
  $rekey             = undef,
  $right             = undef,
  $rightprotoport    = undef,
  $rightsubnet       = undef,
  $rightsubnetwithin = undef,
  $type              = undef,
  $keyingtries       = undef,
  $phase2alg         = undef,
  $aggrmode          = undef,
  $leftsubnet        = undef,
  $dpddelay          = undef,
  $dpdtimeout        = undef,
  $dpdaction         = undef,
  $also              = undef,
  $opts              = undef,
) {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { "/etc/ipsec.d/connections/${name}.conf":
    ensure  => file,
    content => template('openswan/connection.conf.erb'),
    notify  => Class['openswan::service'],
  }
}
