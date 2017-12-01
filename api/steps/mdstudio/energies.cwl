cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/bin/getEnergies.py
arguments: ["energy"]
stdout: getEnergy.out
stderr: getEnergy.err

inputs:
  edr:
    type: File
    inputBinding:
       prefix: -edr
       position: 1

outputs:
  energy_dataframe:
    type: File
    outputBinding: { glob: "energy.out" }
  energyout:
    type: File
    outputBinding: { glob: getEnergy.out }
  energyerr:
    type: File
    outputBinding: { glob: getEnergy.err }
    
