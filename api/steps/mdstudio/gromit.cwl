cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/gromit/call_gromit.sh
arguments: ["$CERISE_API_FILES", "-np", "8"]
stdout: gromit.out
stderr: gromit.err

inputs:
  pdbfile:
    type: File
    inputBinding:
       position: 1
       prefix: -f
  simtime:
    type: double
    inputBinding:
      position: 2
      prefix: -time

outputs:
  gromitout:
    type: File
    outputBinding: { glob: gromit.out }
  gromiterr:
    type: File
    outputBinding: { glob: gromit.err }
  gromacslog:
    type: File
    outputBinding:
      glob: 09-MD.log
  trajectory:
    type: File
    outputBinding:
      glob: "*-MD.part0001.trr"
