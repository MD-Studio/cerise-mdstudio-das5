cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/bin/getEnergies.py
arguments: ["-ene"]
stdout: getEnergy.out
stderr: getEnergy.err

inputs:
  workdir:
    type: Directory
    inputBinding:
       prefix: -d
       position: 1


outputs:
  energy_dataframe:
    type: File
    outputBinding: { glob: "energy.out" }