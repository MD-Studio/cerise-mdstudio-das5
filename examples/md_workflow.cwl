cwlVersion: v1.0
class: Workflow
inputs:
  pdbfile: File

outputs:
  gromitout:
    type: File
    outputSource: gromit/gromitout
  gromiterr:
    type: File
    outputSource: gromit/gromiterr
  gromacslog:
    type: File
    outputSource: gromit/gromacslog
  trajectory:
    type: File
    outputSource: gromit/trajectory

steps:
  gromit:
    run: mdstudio/gromit.cwl
    in:
      pdbfile: pdbfile
      simtime:
        default: 0.001
    out: [gromitout,gromiterr,gromacslog,trajectory]
