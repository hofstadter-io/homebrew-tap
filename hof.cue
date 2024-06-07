package main

import "strings"

name:     "hof"
version:  tag
tag:      "v0.6.9"
commit:   "87cf8d74ad87f1977010966a395950047ce4e1a1"
desc:     "CUE powered developer tools & framework"
homepage: "https://hofstadter.io/"
repo:     "github.com/hofstadter-io/hof"
url:      "https://\(repo).git"
license:  "Apache-2"
branch:   "_dev"
cmddir:   "cmd/hof"
ldflags:  strings.Replace("""
-s -w
-X \(repo)/\(cmddir)/verinfo.Version=#{version}
-X \(repo)/\(cmddir)/verinfo.Commit=#{Utils.git_head}
-X \(repo)/\(cmddir)/verinfo.BuildDate=#{time.iso8601}
-X \(repo)/\(cmddir)/verinfo.GoVersion=#{Formula["go"].version}
-X \(repo)/\(cmddir)/verinfo.BuildOS=#{os}
-X \(repo)/\(cmddir)/verinfo.BuildArch=#{arch}
""", "\n", " ", -1)
