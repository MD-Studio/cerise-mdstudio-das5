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
test_workflow = os.path.join(cur_dir, 'test_workflow.cwl')
webdav_client.mkdir('/input/test')
remote_workflow_path = '/input/test/test_workflow.cwl'
webdav_client.upload_sync(local_path = test_workflow, remote_path = remote_workflow_path)

test_input = os.path.join(cur_dir, 'echo_input.json')
with open(test_input, 'r') as f:
    input_data = json.load(f)

JobDescription = service_client.get_model('job-description')
job_desc = JobDescription(
        name='test_cerise',
        workflow='http://localhost:29594' + remote_workflow_path,
        input=input_data)

(job, response) = service_client.jobs.post_job(body=job_desc).result()

print(str(response))
print(str(job))

while job.state == 'Running' or job.state == 'Waiting':
    time.sleep(1)
    (job, response) = service_client.jobs.get_job_by_id(jobId=job.id).result()
    print(str(response))
    print(str(job))

if job.state == 'Success':
    print(job.output['output']['location'])
    job_output = requests.get(job.output['output']['location']).text
    print(job_output)

#    (job, response) = service_client.jobs.delete_job_by_id(jobId=job.id).result()
#    print(str(response))
#    print(str(job))


