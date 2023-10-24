# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include baseline
#
# @param include_profiles A list of classes to include
# @param include_profiles_knockout A list of classes to exclude
#
class baseline (
  Array[String] $include_profiles = ['certificates','firewall','repos','security','users'],
  Array[String] $include_profiles_knockout = [],
) {
  $base = $include_profiles - $include_profiles_knockout

  $base_profiles = $base.map | String $line | {
    "baseline::${line}"
  }

  require $base_profiles
}
