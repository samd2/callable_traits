# Use, modification, and distribution are
# subject to the Boost Software License, Version 1.0. (See accompanying
# file LICENSE.txt)
#
# Copyright Rene Rivera 2020.

# Configuration for https://cloud.drone.io/.

# For Drone CI we use the Starlark scripting language to reduce duplication.
# As the yaml syntax for Drone CI is rather limited.

def main(ctx):
  return [
  linux_cxx("TOOLSET=gcc COMPILER=g++-4.7 CXXSTD=11 Job 0", "g++-4.7", packages="g++-4.7", buildtype="boost", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-4.7', 'CXXSTD': '11', 'DRONE_JOB_UUID': 'b6589fc6ab'}),
  linux_cxx("TOOLSET=gcc COMPILER=g++-4.8 CXXSTD=11 Job 1", "g++-4.8", packages="g++-4.8", buildtype="boost", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-4.8', 'CXXSTD': '11', 'DRONE_JOB_UUID': '356a192b79'}),
  linux_cxx("TOOLSET=gcc COMPILER=g++-4.9 CXXSTD=11 Job 2", "g++-4.9", packages="g++-4.9", buildtype="boost", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-4.9', 'CXXSTD': '11', 'DRONE_JOB_UUID': 'da4b9237ba'}),
  linux_cxx("TOOLSET=gcc COMPILER=g++-5 CXXSTD=11,14,1z Job 3", "g++-5", packages="g++-5", buildtype="boost", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-5', 'CXXSTD': '11,14,1z', 'DRONE_JOB_UUID': '77de68daec'}),
  linux_cxx("TOOLSET=gcc COMPILER=g++-6 CXXSTD=11,14,1z Job 4", "g++-6", packages="g++-6", buildtype="boost", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-6', 'CXXSTD': '11,14,1z', 'DRONE_JOB_UUID': '1b64538924'}),
  linux_cxx("TOOLSET=gcc COMPILER=g++-7 CXXSTD=11,14,1z,17 Job 5", "g++-7", packages="g++-7", buildtype="boost", image="cppalliance/droneubuntu1404:1", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-7', 'CXXSTD': '11,14,1z,17', 'DRONE_JOB_UUID': 'ac3478d69a'}),
  linux_cxx("TOOLSET=gcc COMPILER=g++-8 CXXSTD=11,14,1z,17 Job 6", "g++-8", packages="g++-8", buildtype="boost", image="cppalliance/droneubuntu1404:1", environment={'TOOLSET': 'gcc', 'COMPILER': 'g++-8', 'CXXSTD': '11,14,1z,17,2a', 'DRONE_JOB_UUID': 'c1dfd96eea'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-3.5 CXXSTD=11 Job 7", "clang++", packages="clang-3.5", llvm_os="precise", llvm_ver="3.5", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-3.5', 'CXXSTD': '11', 'DRONE_JOB_UUID': '902ba3cda1'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-3.6 CXXSTD=11 Job 8", "clang++", packages="clang-3.6", llvm_os="precise", llvm_ver="3.6", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-3.6', 'CXXSTD': '11', 'DRONE_JOB_UUID': 'fe5dbbcea5'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-3.7 CXXSTD=11 Job 9", "clang++", packages="clang-3.7", llvm_os="precise", llvm_ver="3.7", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-3.7', 'CXXSTD': '11', 'DRONE_JOB_UUID': '0ade7c2cf9'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-3.8 CXXSTD=11, Job 10", "clang++-3.8", packages="clang-3.8 libstdc++-4.9-dev", llvm_os="precise", llvm_ver="3.8", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-3.8', 'CXXSTD': '11,14,1z', 'DRONE_JOB_UUID': 'b1d5781111'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-3.9 CXXSTD=11, Job 11", "clang++-3.9", packages="clang-3.9 libstdc++-4.9-dev", llvm_os="precise", llvm_ver="3.9", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-3.9', 'CXXSTD': '11,14,1z', 'DRONE_JOB_UUID': '17ba079149'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-4.0 CXXSTD=11, Job 12", "clang++-4.0", packages="clang-4.0", llvm_os="xenial", llvm_ver="4.0", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-4.0', 'CXXSTD': '11,14,1z', 'DRONE_JOB_UUID': '7b52009b64'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-5.0 CXXSTD=11, Job 13", "clang++-5.0", packages="clang-5.0", llvm_os="xenial", llvm_ver="5.0", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-5.0', 'CXXSTD': '11,14,1z,17', 'DRONE_JOB_UUID': 'bd307a3ec3'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-6.0 CXXSTD=11, Job 14", "clang++-6.0", packages="clang-6.0", llvm_os="xenial", llvm_ver="6.0", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-6.0', 'CXXSTD': '11,14,1z,17', 'DRONE_JOB_UUID': 'fa35e19212'}),
  linux_cxx("TOOLSET=clang COMPILER=clang++-7 CXXSTD=11,14 Job 15", "clang++-7", packages="clang-7", llvm_os="xenial", llvm_ver="7", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++-7', 'CXXSTD': '11,14,1z,17', 'DRONE_JOB_UUID': 'f1abd67035'}),
  osx_cxx("TOOLSET=clang COMPILER=clang++ CXXSTD=11,14,1 Job 16", "clang++", packages="", buildtype="boost", environment={'TOOLSET': 'clang', 'COMPILER': 'clang++', 'CXXSTD': '11,14,1z', 'DRONE_JOB_OS_NAME': 'osx', 'DRONE_JOB_UUID': '1574bddb75'}),
  ]

# Generate pipeline for Linux platform compilers.
def linux_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
  environment_global = {
      "TRAVIS_BUILD_DIR": "/drone/src",

      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
      }

  environment_current=environment_global
  environment_current.update(environment)

  return {
    "name": "Linux %s" % name,
    "kind": "pipeline",
    "type": "docker",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "linux",
      "arch": arch
    },
    # Create env vars per generation arguments.
    "environment": environment_current,
    "steps": [
      {
        "name": "Everything",
        "image": image,
        "privileged" : privileged,
        "environment": stepenvironment,
        "commands": [

          "echo '==================================> SETUP'",
          "uname -a",
          # Moved to Docker
          # "apt-get -o Acquire::Retries=3 update && DEBIAN_FRONTEND=noninteractive apt-get -y install tzdata && apt-get -o Acquire::Retries=3 install -y sudo software-properties-common wget curl apt-transport-https git make cmake apt-file sudo unzip libssl-dev build-essential autotools-dev autoconf libc++-helpers automake g++",
          # "for i in {1..3}; do apt-add-repository ppa:git-core/ppa && break || sleep 2; done",
          # "apt-get -o Acquire::Retries=3 update && apt-get -o Acquire::Retries=3 -y install git",
          "echo '==================================> PACKAGES'",
          "./.drone/linux-cxx-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }

def windows_cxx(name, cxx="g++", cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/dronevs2019", buildtype="boost", environment={}, stepenvironment={}, privileged=False):
  environment_global = {
      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
    }

  environment_current=environment_global
  environment_current.update(environment)

  return {
    "name": "Windows %s" % name,
    "kind": "pipeline",
    "type": "docker",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "windows",
      "arch": arch
    },
    # Create env vars per generation arguments.
    "environment": environment_current,
    "steps": [
      {
        "name": "Everything",
        "image": image,
        "privileged": privileged,
        "environment": stepenvironment,
        "commands": [
          "echo '==================================> SETUP'",
          "echo '==================================> PACKAGES'",
          "bash.exe ./.drone/windows-msvc-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "bash.exe ./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }
def osx_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", osx_version="", xcode_version="", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
  environment_global = {
      # "TRAVIS_BUILD_DIR": "/drone/src",
      "CXX": cxx,
      "CXXFLAGS": cxxflags,
      "PACKAGES": packages,
      "LLVM_OS": llvm_os,
      "LLVM_VER": llvm_ver
      }

  environment_current=environment_global
  environment_current.update(environment)

  # exec runner only has step-level environment variables:
  environment_step = environment_current
  environment_step.update(stepenvironment)

  if xcode_version:
    environment_step["DEVELOPER_DIR"] = "/Applications/Xcode-" + xcode_version +  ".app/Contents/Developer"
    if not osx_version:
        if xcode_version[0:2] in [ "12","11","10"]:
            osx_version="catalina"
        elif xcode_version[0:1] in [ "9","8","7","6"]:
            osx_version="highsierra"
  else:
    osx_version="catalina"

  return {
    "name": "OSX %s" % name,
    "kind": "pipeline",
    "type": "exec",
    "trigger": { "branch": [ "master","develop", "drone*", "bugfix/*", "feature/*", "fix/*", "pr/*" ] },
    "platform": {
      "os": "darwin",
      "arch": arch
    },
    "node": {
      "os": osx_version
      },
    "steps": [
      {
        "name": "Everything",
        # "image": image,
        "privileged" : privileged,
        "environment": environment_step,
        "commands": [

          "echo '==================================> SETUP'",
          "uname -a",
          # "apt-get -o Acquire::Retries=3 update && apt-get -o Acquire::Retries=3 -y install git",
          "echo '==================================> PACKAGES'",
          "./.drone/osx-cxx-install.sh",

          "echo '==================================> INSTALL AND COMPILE'",
          "./.drone/%s.sh" % buildtype,
        ]
      }
    ]
  }

def freebsd_cxx(name, cxx, cxxflags="", packages="", llvm_os="", llvm_ver="", arch="amd64", image="cppalliance/droneubuntu1604:1", buildtype="boost", environment={}, stepenvironment={}, jobuuid="", privileged=False):
    pass
