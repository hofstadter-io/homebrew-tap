.PHONY: gen gen-src gen-bin
gen: gen-src
gen-src:
	hof gen hof.cue -T templates/from-git-source.rb=hof.rb --no-format --diff3
gen-bin:
	hof gen hof.cue -T templates/from-gh-release.rb=hof.rb --no-format

