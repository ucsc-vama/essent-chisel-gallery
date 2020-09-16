essent/README.md:
	git submodule update --init essent

firrtl-sig/README.md:
	git submodule update --init firrtl-sig

essent/utils/bin/essent.jar: essent/README.md firrtl-sig/README.md
	cd ./essent; sbt 'assembly'
