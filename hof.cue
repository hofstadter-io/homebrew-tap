package main

import "strings"

name: "hof"
version: "0.6.7-beta.2"
tag: "v0.6.7-beta.2"
commit:  "d5aca0d91efb338dcd5430e879d6ded363d39761"
desc: "Flexible data modeling & code generation system"
homepage: "https://hofstadter.io/"
repo: "github.com/hofstadter-io/hof"
url: "https://\(repo).git"
license: "BSD-3-Clause"
branch: "_dev"
cmddir: "cmd/hof"
ldflags: strings.Replace("""
-s -w
-X \(repo)/\(cmddir)/verinfo.Version=#{version}
-X \(repo)/\(cmddir)/verinfo.Commit=#{Utils.git_head}
-X \(repo)/\(cmddir)/verinfo.BuildDate=#{time.iso8601}
-X \(repo)/\(cmddir)/verinfo.GoVersion=#{Formula["go"].version}
-X \(repo)/\(cmddir)/verinfo.BuildOS=#{os}
-X \(repo)/\(cmddir)/verinfo.BuildArch=#{arch}
""", "\n", " ", -1)
