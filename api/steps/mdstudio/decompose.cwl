cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/energies/call_decompose.sh
arguments: ["$CERISE_API_FILES"]
stdout: decompose.out
stderr: decompose.err

inputs:
  res:
    type: string
    inputBinding:
       position: 1

outputs:
  energy:
    type: File
    outputBinding: { glob: "decompose.ene" }

    
