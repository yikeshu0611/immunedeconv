#!/bin/bash

# R refuses to build packages that mark themselves as Priority: Recommended
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION

# force anaconda not to use system libraries
echo ".libPaths(.Library)" > $("$R"script -e "cat(R.home())")/etc/Rprofile.site
$R CMD INSTALL --build .

