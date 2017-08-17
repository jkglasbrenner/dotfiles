#!/bin/bash
#
# Wrapper for cpanm to install or uninstall and re-stow perl5 packages in a stow directory
# or for bootstrapping a local cpanm installation.

###########################################################################################
# Global parameters
###########################################################################################
readonly mode="$1"
readonly args="${@:2}"

###########################################################################################
# Install perl5 packages into a local directory using cpanminus and re-stow
#
# Globals:
#   None
# Arguments:
#   1: install_packages                    # required
#   2: local_dir                           # default: $HOME/.local
#   3: local_stow_dir                      # default: ${local_dir}/stow
#   4: relative_stow_dir_perl5_packages    # default: perl5-packages
#   5: stow                                # default: ${local_dir}/bin/stow
# Returns:
#   None
###########################################################################################

cpanm_install_package () {
  # Position arguments
  local install_packages="$1"
  local local_dir="${2:-$HOME/.local}"
  local local_stow_dir="${3:-${local_dir}/stow}"
  local relative_stow_dir_perl5_packages="${4:-perl5-packages}"
  local stow="${5:-${local_dir}/bin/stow}"

  # Local variables
  local perl5_packages_local="${local_stow_dir}/${relative_stow_dir_perl5_packages}"
  local perl5_packages_lib="${perl5_packages_local}/lib/perl5"
  local cpanm="${perl5_packages_local}/bin/cpanm"

  # Evaluate local::lib in subshell and install package
  echo "Installing the packages ${install_packages} to ${perl5_packages_local} ..."
  (
  eval \
    $(
     perl \
      -I${perl5_packages_lib} \
      -Mlocal::lib=${perl5_packages_local}
     )
  export MANPATH="${perl5_packages_local}/share/man${MANPATH:+:$MANPATH}"
  ${cpanm} ${install_packages}
  )

  # Re-stow perl5 packages
  ${stow} \
    -d ${local_stow_dir} \
    -t ${local_dir} \
    --no-folding \
    -R ${relative_stow_dir_perl5_packages}
}

###########################################################################################
# Uninstall a perl5 package using cpanminus and re-stow
#
# Globals:
#   None
# Arguments:
#   1: uninstall_package                   # required
#   2: local_dir                           # default: $HOME/.local
#   3: local_stow_dir                      # default: ${local_dir}/stow
#   4: relative_stow_dir_perl5_packages    # default: perl5-packages
#   5: stow                                # default: ${local_dir}/bin/stow
# Returns:
#   None
###########################################################################################

cpanm_uninstall_package () {
  # Position arguments
  local uninstall_package="$1"
  local local_dir="${2:-$HOME/.local}"
  local local_stow_dir="${3:-${local_dir}/stow}"
  local relative_stow_dir_perl5_packages="${4:-perl5-packages}"
  local stow="${5:-${local_dir}/bin/stow}"

  # Local variables
  local perl5_packages_local="${local_stow_dir}/${relative_stow_dir_perl5_packages}"
  local perl5_packages_lib="${perl5_packages_local}/lib/perl5"
  local cpanm="${perl5_packages_local}/bin/cpanm"

  # Evaluate local::lib in subshell and install package
  echo "Uninstalling the package ${uninstall_package} from ${perl5_packages_local} ..."
  (
  eval \
    $(
     perl \
      -I${perl5_packages_lib} \
      -Mlocal::lib=${perl5_packages_local}
     )
  export MANPATH="${perl5_packages_local}/share/man${MANPATH:+:$MANPATH}"
  ${cpanm} \
    -U ${uninstall_package}
  )

  # Re-stow perl5 packages
  ${stow} \
    -d ${local_stow_dir} \
    -t ${local_dir} \
    --no-folding \
    -R ${relative_stow_dir_perl5_packages}
}

###########################################################################################
# Local bootstrap installation for cpanminus
#
# Globals:
#   None
# Arguments:
#   1: local_dir                           # default: $HOME/.local
#   2: local_stow_dir                      # default: ${local_dir}/stow
#   3: relative_stow_dir_perl5_packages    # default: perl5-packages
#   4: stow                                # default: ${local_dir}/bin/stow
# Returns:
#   None
###########################################################################################

cpanm_bootstrap () {
  # Position arguments
  local local_dir="${1:-$HOME/.local}"
  local local_stow_dir="${2:-${local_dir}/stow}"
  local relative_stow_dir_perl5_packages="${3:-perl5-packages}"
  local stow="${4:-${local_dir}/bin/stow}"

  # Local variables
  local perl5_packages_local="${local_stow_dir}/${relative_stow_dir_perl5_packages}"
  local perl5_packages_lib="${perl5_packages_local}/lib/perl5"

  # Bootstrap installation for cpanminus in subshell
  echo "Installing cpanm to ${perl5_packages_local} ..."
  (
  export PATH="${PATH}:${perl5_packages_local}/bin"
  export PERL5LIB=${perl5_packages_lib}
  export PERL_MB_OPT="--install_base '${perl5_packages_local}'"
  export PERL_MM_OPT="INSTALL_BASE=${perl5_packages_local}"
  export MANPATH="${perl5_packages_local}/share/man${MANPATH:+:$MANPATH}"
  mkdir -p ${perl5_packages_local}
  curl \
    -L http://cpanmin.us \
    | perl - \
    -l ${perl5_packages_local} \
    App::cpanminus \
    local::lib
  )

  # Stow perl5 packages
  ${stow} \
    -d ${local_stow_dir} \
    -t ${local_dir} \
    --no-folding \
    ${relative_stow_dir_perl5_packages}
}

###########################################################################################
# Main script
###########################################################################################

if [[ ${mode} == "install" ]]; then
  echo ""
  cpanm_install_package ${args}
  echo ""
elif [[ ${mode} == "uninstall" ]]; then
  echo ""
  cpanm_uninstall_package ${args}
  echo ""
elif [[ ${mode} == "bootstrap" ]]; then
  echo ""
  cpanm_bootstrap ${args}
  echo ""
elif [[ ${mode} == "help" || ${mode} == "--help" || ${mode} == "-h" || -z ${mode} ]]; then
  echo "cpanm.sh - The wrapper for cpanminus"
  echo ""
  echo "Usage: cpanm.sh [mode] [position_arguments ..]"
  echo ""
  echo "---------------------------------------------------------------------------------"
  echo "Mode:"
  echo "   install                                     # Install perl5 packages"
  echo ""
  echo "Position Arguments:"
  echo "  1: Packages to install                       # required"
  echo "  2: Local installation directory              # default: \$HOME/.local"
  echo "  3: Local Stow Directory                      # default: \${local_dir}/stow"
  echo "  4: Name of local Perl5 packages directory    # default: perl5-packages"
  echo "  5: Path to stow executable                   # default: \${local_dir}/bin/stow"
  echo ""
  echo "---------------------------------------------------------------------------------"
  echo "Mode:"
  echo "   uninstall                                   # Uninstall a perl5 package"
  echo ""
  echo "Position Arguments:"
  echo "  1: Package to uninstall                      # required"
  echo "  2: Local installation directory              # default: \$HOME/.local"
  echo "  3: Local Stow Directory                      # default: \${local_dir}/stow"
  echo "  4: Name of local Perl5 packages directory    # default: perl5-packages"
  echo "  5: Path to stow executable                   # default: \${local_dir}/bin/stow"
  echo ""
  echo "---------------------------------------------------------------------------------"
  echo "Mode:"
  echo "   bootstrap                                   # Locally install cpanm"
  echo ""
  echo "Positional Arguments:"
  echo "  1: Local installation directory              # default: \$HOME/.local"
  echo "  2: Local Stow Directory                      # default: \${local_dir}/stow"
  echo "  3: Name of local Perl5 packages directory    # default: perl5-packages"
  echo "  4: Path to stow executable                   # default: \${local_dir}/bin/stow"
  echo ""
else
  echo 'Invalid mode, run "cpanm.sh help" for help'
  echo ""
fi

