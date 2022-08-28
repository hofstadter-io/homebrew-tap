package main

import "strings"

name: "hof"
version: "0.6.6"
tag: "v0.6.6"
commit:  "0f49b4d71a66788b006daacf905a2b138768beca"
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

builds: {
	[os=string]: [arch=string]: {
		"name": name

		_url: "https://\(repo)/releases/download/\(tag)/\(name)_\(version)"
		sha256: string
	}
	linux: {
		intel: A={
			url: "\(A._url)_Linux_x86_64"
			sha256: "581958cf7a69c2b9dc541ad0aac25396f7705d1533f89a90ab4a4b27a1128131"
		}
		arm: A={
			url: "\(A._url)_Linux_arm64"
			sha256: "01c13dbd5d2dc3eaa573d5400c2a013d3fd0fe2b4de8f499c0bef3f10c90cc12"
		}
	}
	macos: {
		intel: A={
			url: "\(A._url)_Darwin_x86_64"
			sha256: "e1cf5a28e07c34a4aa1dbd7f2c0149a4d76f3450e14e5c0ff1e28813e48bf33b"
		}
		arm: A={
			url: "\(A._url)_Darwin_arm64"
			sha256: "124ad1d08c959690510a8983ac283b4c4ffafda2378768e89af2cd3af7226b54"
		}
	}
}
