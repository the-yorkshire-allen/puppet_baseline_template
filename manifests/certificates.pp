# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include baseline::certificates
#
# @param include_profiles An array of certificates to include
# @param include_profiles_knockout An array of certificates to exclude
# @param module_base The base path to the certificates module
#
class baseline::certificates (
  Array[String] $include_profiles = [],
  Array[String] $include_profiles_knockout = [],
  String $module_base = 'profile::certificates_module',
) {
  $includes = $include_profiles - $include_profiles_knockout

  $final_includes_profiles = $includes.map | String $line | {
    "${module_base}::${line}"
  }

  require $final_includes_profiles
}
