[![Docker Build Status](https://img.shields.io/docker/build/mdstudio/cerise-mdstudio-das5.svg)](https://hub.docker.com/r/mdstudio/cerise-mdstudio-das5/)

# Cerise specialisation for MDStudio and DAS5

This repository contains a Cerise specialisation for MDStudio and DAS5.

It's work in progress.

## Running

### Install the service via Docker

Get the specialised service from Docker:

```bash
docker pull mdstudio/cerise-mdstudio-das5:develop
```

### Start it

```bash
docker run --name=cerise-mdstudio-das5 -p 29593-29594:29593-29594 --env CERISE_USERNAME=<username> --env CERISE_PASSWORD=<password> mdstudio/cerise-mdstudio-das5:develop
```
This will give a warning about the Slurm version not being supported, which
you can safely ignore.

If this is the first time you run this Cerise specialisation, it will stage a
bunch of files to a directory named `.cerise` in your home directory on DAS-5.
This may take a bit of time, so it may take a moment for the service to start
processing jobs. You can submit them right away though.

Note that inserting the user name and password via an environment variable is
not ideal, amongst others it leaves a copy of them in your `~/.bash_history`
(from where you may want to delete it now, although it should be only readable
to you yourself). Overlay-mounting a file would be another option, but that
means that the username and password are stored on disk. If we start the service
from Python using docker-py, then the environment variables would probably be
the better option.

### Run a job

Now we can submit an example Gromit/GROMACS job, using a virtual environment to
keep the dependencies away from the rest of the system:

```bash
cd examples/
virtualenv -p python3 venv
. venv/bin/activate
pip3 install bravado
python3 run_md.py
```

This will take about 2 minutes to complete.


## Legal Notes

This repository is covered by the following license grant:

   Copyright 2018 Netherlands eScience Center and VU University Amsterdam

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
