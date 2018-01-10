cwlVersion: v1.0

class: CommandLineTool
baseCommand: $CERISE_API_FILES/mdstudio/github/cerise-mdstudio-das5/mdstudio/gromit/call_gromit.sh
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
  ligand_pdb:
    type: File
    inputBinding:
      position: 3
  ligand_top:
    type: File
    inputBinding:
      position: 4
  electrostatics:
    type: string
    inputBinding:
      position: 5      
  forcefield:
    type: string
    inputBinding:
      position: 6      
  periodic_distance:
    type: double
    inputBinding:
      position: 7
  pressure:
    type: double
    inputBinding:
      position: 8     
  prfc:
    type: string
    inputBinding:
      position: 9
  ptau:
    type: double
    inputBinding:
      position: 10
  residues:
    type: string
    inputBinding:
      position: 11
  resolution:
    type: double
    inputBinding:
      position: 12
  salinity:
    type: double
    inputBinding:
      position: 13
  sim_time:
    type: double
    inputBinding:
      position: 14  
  solvent:
    type: string
    inputBinding:
      position: 15
  temperature:
    type: string
    inputBinding:
      position: 16  
  ttau:
    type: double
    inputBinding:
      position: 17  

outputs:
  gromitout:
    type: File
    outputBinding: { glob: gromit.out }
  gromiterr:
    type: File
    outputBinding: { glob: gromit.err }
  gromacslog_step2:
    type: File
    outputBinding: { glob: 02-PBC.log }
  gromacslog_step3:
    type: File
    outputBinding: { glob: 03-EMv.log }
  gromacslog_step4:
    type: File
    outputBinding: { glob: 04-SOLVATION.log }
  gromacslog_step5:
    type: File
    outputBinding: { glob: 05-EMs.log }
  gromacslog_step6a:
    type: File
    outputBinding: { glob: 06-PR-NVT-1.log }
  gromacslog_step6b:
    type: File
    outputBinding: { glob: 06-PR-NVT-2.log }
  gromacslog_step7:
    type: File
    outputBinding: { glob: 07-NPT-1.log }
  gromacslog_step8:
    type: File
    outputBinding: { glob: 08-MD-PRE.log }
  gromacslog_step9:
    type: File
    outputBinding: { glob: 09-MD.log }
  trajectory:
    type: File
    outputBinding: { glob: "*-MD.part0001.trr" }
  energy:
    type: File
    outputBinding: { glob: "*-MD.part*.edr" }
  gro:
    type: File
    outputBinding: { glob: "*-sol.gro" }
  ndx:
    type: File
    outputBinding: { glob: "*-sol.ndx" }
  top:
    type: File
    outputBinding: { glob: "*-sol.top" }
  mdp:
    type: File
    outputBinding: { glob: md-prod-out.mdp}
