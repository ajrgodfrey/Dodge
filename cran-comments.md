This update is to deal with the failure of v0.8 (nearly five years old) to export properly and to define the s3 methods created in the package.

I took the chance to update the package by:

-I have updated the documentation for the package by switching to use of Roxygen, instead of manual editing of Rd files.
- adding news.md, readme.md, cran-comments.md, and conduct.md to the package.
- putting a development version on github (ajrgodfrey/Dodge)


## Test environments
* local OS X install, R 3.5.0
* ubuntu 12.04 (on travis-ci), R 3.5.0
* win-builder (devel and release)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.

## Reverse dependencies

There are no known reverse dependencies.

---

* I have run R CMD check on the NUMBER downstream dependencies.
  (Summary at ...). 
  
* FAILURE SUMMARY

* All revdep maintainers were notified of the release on RELEASE DATE.
