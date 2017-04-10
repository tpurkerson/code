class paramtest (
  String $xvar  = $paramtest::params::xvar,
  String $yvar = $paramtest::params::yvar,
  String $zvar = $paramtest::params::zvar
) inherits paramtest::params {

  notify {"xvar is ${xvar}" :}
  notify {"yvar is ${yvar}" :}
  notify {"zvar is ${zvar}" :}

}

