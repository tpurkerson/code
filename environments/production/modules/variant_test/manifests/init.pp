class variant_test (
    Variant[String, Undef] $somevar = $variant_test::params::somevar,
    String $string_test = 'ZZZQQQ',
    Integer $int_test = $variant_test::params::int_test,
#    Undef $undef_test = undef
    Undef $undef_test = $variant_test::params::undef_test
#    Integer $int_test = 272
) inherits variant_test::params {
  notify{"this is variant_test" :}
  notify{"somevar is ${somevar}" :}
  notify{"string_test is ${string_test}" :}
  notify{"int_test is ${int_test}" :}
  notify{"xUndef is ${undef_test}" :}
}
