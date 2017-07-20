# Cerise specialisation for MDStudio and DAS5

This repository contains a Cerise specialisation for MDStudio and DAS5.

It's work in progress.


## Legal Notes

### GROMACS

This repository contains a copy of [GROMACS](http://www.gromacs.org) 2016.3 in
both source and binary (compiled for DAS5/VU) form. The binaries are in the
api/files/mdstudio/gromacs/, and they were compiled from the
gromacs-2016.3.tar.gz source archive in the gromacs/ directory. The GMXRC.*
scripts were modified to point to the installed location, according to the
instructions in them.

GROMACS is Free Software, available under the GNU Lesser General Public License
(LGPL), version 2.1. You can redistribute it and/or modify it under the terms of
the LGPL as published by the Free Software Foundation; either version 2.1 of the
License, or (at your option) any later version.

Note that GROMACS has its own dependencies, some of which are included in
GROMACS itself, with their own licenses. We refer to the LICENSE_GROMACS file
(which is simply the COPYING file from the GROMACS source code archive) for
details.

### gromit

This repository contains a modified copy of gromit.sh from
[gromit](https://github.com/Tsjerk/gromit) in
api/files/mdstudio/gromit/gromit_mpi.sh. Gromit is licensed under the GNU
General Public License version 2.0 (see the file LICENSE_GROMIT).

### Other files

The rest of this repository is covered by the following license grant:

   Copyright 2017 Netherlands eScience Center and VU University Amsterdam

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
