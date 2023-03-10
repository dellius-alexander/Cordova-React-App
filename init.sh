#!/usr/bin/env bash
#####################################################################
COMMAND=${1:-"$([[ ${1} =~ (run|emulat(e|er|or){1}|plugin(s)?){1} ]] && echo ${1} &2>/dev/null )"} # Defaults to run -- platform
PLATFORMS=${2:-"$([[ ${2} =~ (browser|ios|android|osx|add|remove|rm)+ ]] && echo ${2} &2>/dev/null )"} # Defaults to run -- platform -- browser
PLUGINS=${3:-"$([[ ${3} =~ ([a-zA-z0-9_-]+) ]] && echo ${3} &2>/dev/null )"}
# Verify that NODE_ENV is set
if [[ -z ${NODE_ENV} ]]; then
  __error "You must set NODE_ENV environment variable then rerun ${0}."
  exit 1;
fi
# Find and run the command
case ${COMMAND} in
run)
  echo "Running ${PLATFORMS}........"
  npm install &2>/dev/null
  npm audit fix --force &2>/dev/null
  echo ${NODE_ENV} | node scripts/build.js;
  cordova build --debug;
#  nodemon scripts/start.js;
  cordova run ${PLATFORMS} -- --live-reload  --debug;
  ;;
emulat(e|or))
  echo "Running ${PLATFORMS}........"
  npm install &2>/dev/null
  npm audit fix --force &2>/dev/null
  echo ${NODE_ENV} | node scripts/build.js;
  cordova build --debug;
#  nodemon scripts/start.js;
  cordova emulate ${PLATFORMS} -- --live-reload  --debug;
  ;;
serve(r)?)
  echo "Running ${PLATFORMS}........"
  npm install &2>/dev/null
  npm audit fix --force &2>/dev/null
  echo ${NODE_ENV} | node scripts/build.js;
  cordova build --debug;
  #  nodemon scripts/start.js;
  cordova serve ${PLATFORMS} -- --live-reload  --debug &2>/dev/null || echo "Error service ${PLATFORMS}...$?"
  ;;
clean)
  echo "Cleaning up ${PLATFORMS}........"
  cordova clean ${PLATFORMS} &2>/dev/null || echo "Error executing clean on ${PLATFORMS}...$?"
  ;;
plugin(s)?)
  echo "Running ${PLATFORMS}........"
  cordova plugin ${PLATFORMS} ${PLUGINS} &2>/dev/null || echo "No plugin found...$?"
*)
  printf """\n
  Usage: |
  /bin/sh ${0} \\
  [COMMAND]{run|emulat(e|er|or){1}|plugin(s)?} \\
  [PLATFORMS]{browser|ios|android|osx|add|remove|rm}
  """
  ;;
esac


__error(){
  if [[ -z "${1}" ]]; then
    echo "ERROR: no message provided."
    exit 1
  else
    echo "ERROR: ${1}"
    exit !?
  fi
}