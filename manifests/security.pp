# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include baseline::security
#
# @param include_profiles An array of profiles to include for security
# @param include_profiles_knockout An array of profiles to exclude for security
# @param module_base The base name of the module to use for profiles
#
class baseline::security (
  Array[String] $include_profiles = [],
  Array[String] $include_profiles_knockout = [],
  String $module_base = 'profile::security_module',
) {
  $includes = $include_profiles - $include_profiles_knockout

  $final_includes_profiles = $includes.map | String $line | {
    "${module_base}::${line}"
  }

  require $final_includes_profiles
}
