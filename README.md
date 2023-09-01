# TODO #

## Description ##
The goal of this project is to create a script which when run will:
 - Spin up a docker container with a D compiler & dub installed.
 - Scrape a list of all packages on the dub registry
 - Download each project, ensure they build, and that they have tests to run
 - Compile a list of packages that can be used to test future dlang compiler changes against to see which (if any) package(s) break as a result.
 
 
## Steps: ##
 1. Get a docker container working with dmd/ldc/gdc
 2. Successfully get a list of dub packages to test
 3. Successfully download a dub package, build it, and test it. All inside a docker container.
 
