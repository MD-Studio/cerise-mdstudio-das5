cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/gromit/call_gromit.sh
arguments: ["$CERISE_API_FILES"]
stdout: gromit.out
stderr: gromit.err

inputs:
  protein_pdb:
    type: File
    inputBinding:
       position: 1
  protein_top:
    type: File
    inputBinding:
       position: 2
  protein_itp:
    type: File
    inputBinding:
      position: 3
  ligand_pdb:
    type: File
    inputBinding:
      position: 4
  ligand_top:
    type: File
    inputBinding:
      position: 5
  ligand_itp:
    type: File
    inputBinding:
      position: 6
  force_field:
    type: string
    default: gromos
    inputBinding:
      position: 7
  sim_time:
    type: double
    default: 0.0001
    inputBinding:
      position: 8

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
