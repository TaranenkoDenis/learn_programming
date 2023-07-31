.PHONY: generate watch clean prepare coverage_report format

generate:
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm dart format --set-exit-if-changed -l 100 .

watch:
	fvm flutter packages pub run build_runner watch --delete-conflicting-outputs

clean:
	fvm flutter clean

prepare:
	fvm flutter pub get

coverage_report:
	fvm flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html
	open coverage/html/index.html

format:
	fvm dart format -l 100 --fix .

