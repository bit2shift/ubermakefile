#!/usr/bin/env -S name=dummy jq --run-tests

# Each test is composed of 3+ contiguous lines.
# Comments and empty lines are ignored.
# 1) test program
# 2) input data
# 3) expected output (more lines if the output has multiple results)

import "ubermakefile" as u; u::depbuild_commands
{"dependencies":{"dummy":{"build":["hello","world"]}}}
"'hello' 'world'"

import "ubermakefile" as u; u::build_flags(.flags.common; "dummy:")
{"flags":{"common":{"CXXFLAGS":"-std=c++20","CPPFLAGS":"-Iinc"}}}
"$(eval dummy: CXXFLAGS+=-std=c++20)"
"$(eval dummy: CPPFLAGS+=-Iinc)"

import "ubermakefile" as u; u::build_pkgconfig("--libs")
{"dependencies":{"aa":{"static":false},"bb":{"static":true}}}
"pkg-config"
"--libs"
"aa"
";"
"pkg-config"
"--libs"
"--static"
"bb"
";"
