.PHONY: documentation

test:
	@docker-compose up --build test

documentation:
	@sourcekitten doc \
		--spm \
		--module-name SGSL \
		> SK_SGSL.json
	@sourcekitten doc \
		--spm \
		--module-name Statistics \
		> SK_Statistics.json
	@sourcekitten doc \
		--spm \
		--module-name MathematicalFunctions \
		> SK_MathematicalFunctions.json
	@sourcekitten doc \
		--spm \
		--module-name RandomNumberGeneration \
		> SK_RandomNumberGeneration.json
	@jazzy \
		--clean \
		--output Documentation \
		--github_url https://github.com/kongzii/SGSL \
		--min-acl internal \
		--sourcekitten-sourcefile SK_RandomNumberGeneration.json,SK_SGSL.json,SK_Statistics.json,SK_MathematicalFunctions.json
	@rm SK_*.json
