#!/usr/bin/env cwl-runner

cwlVersion: v1.0

class: Workflow

inputs:
  msg: string

outputs:
  output:
    type: File
    outputSource: echo/output

steps:
  echo:
    run: test/echo.cwl
    in:
      message: msg
    out:
      - output
