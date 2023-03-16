package main

import "strings"

name: "hof"
version: tag
tag: "v0.6.8-beta.12"
commit:  "475328015adf6d102e5227a646e63f6a2b23119f"
desc: "A flexible data modeling & code generation system"
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
