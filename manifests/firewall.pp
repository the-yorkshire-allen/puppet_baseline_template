# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include baseline::firewall
#
# @param include_profiles includes for firewall baseline
# @param include_profiles_knockout includes for firewall baseline
# @param module_base base name for firewall module
#
class baseline::firewall (
  Array[String] $include_profiles = [],
  Array[String] $include_profiles_knockout = [],
  String $module_base = 'profile::firewall_module',
) {
  $includes = $include_profiles - $include_profiles_knockout

  $final_includes_profiles = $includes.map | String $line | {
    "${module_base}::${line}"
  }

  require $final_includes_profiles
}
