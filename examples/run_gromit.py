#!/usr/bin/env python

import json
import os
import requests
import time

import webdav.client as wc
from bravado.client import SwaggerClient

webdav_client = wc.Client({'webdav_hostname': 'http://localhost:29594'})

bravado_config = {
        'also_return_response': True
        }
service_client = SwaggerClient.from_url('http://localhost:29593/swagger.json', config=bravado_config)

cur_dir = os.path.dirname(__file__)
test_workflow = os.path.join(cur_dir, 'md_workflow.cwl')
webdav_client.mkdir('/input/gromit_job')
remote_workflow_path = '/input/gromit_job/md_workflow.cwl'
webdav_client.upload_sync(local_path = test_workflow, remote_path = remote_workflow_path)

pdb_file = os.path.join(cur_dir, '1qm3.pdb')
remote_pdb_path = '/input/gromit_job/1qm3.pdb'
webdav_client.upload_sync(local_path = pdb_file, remote_path = remote_pdb_path)

input_desc = {
        "pdbfile": {
            "class": "File",
            "location": 'http://localhost:29594' + remote_pdb_path,
            },
        "time": 0.0001
        }

JobDescription = service_client.get_model('job-description')
job_desc = JobDescription(
        name='run_gromit',
        workflow='http://localhost:29594' + remote_workflow_path,
        input=input_desc)

(job, response) = service_client.jobs.post_job(body=job_desc).result()

print(str(response))
print(str(job))

while job.state == 'Running' or job.state == 'Waiting':
    time.sleep(10)
    (job, response) = service_client.jobs.get_job_by_id(jobId=job.id).result()
    print(str(response))
    print(str(job))

if job.state == 'Success':
    print(job.output['trajectory']['location'])
    job_output = requests.get(job.output['trajectory']['location']).content
    with open('1qm3.trr', 'wb') as f:
        f.write(job_output)

#    (job, response) = service_client.jobs.delete_job_by_id(jobId=job.id).result()
#    print(str(response))
#    print(str(job))


