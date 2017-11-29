cwlVersion: v1.0

class: CommandLineTool
baseCommand: ls
arguments: ["."] 
stdout: ls.out
stderr: ls.err

inputs: []
outputs:
   output:
    type: stdout
    output: