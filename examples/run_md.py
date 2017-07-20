import os
import requests
import time
from bravado.client import SwaggerClient

# Create a client for the REST API
srv_loc = 'http://localhost:29593'
srv = SwaggerClient.from_url(srv_loc + '/swagger.json')
JobDescription = srv.get_model('job-description')

# Make a directory to store the input for this job
filestore = 'http://localhost:29594'
requests.request('MKCOL', filestore + '/input/example_job')

# Upload files
workflow_uri = filestore + '/input/example_job/md_workflow.cwl'
with open('md_workflow.cwl', 'rb') as workflow_file:
    requests.put(workflow_uri, data=workflow_file.read())

pdb_uri = filestore + '/input/example_job/1qm3.pdb'
with open('1qm3.pdb', 'rb') as pdb_file:
    requests.put(pdb_uri, data=pdb_file.read())

# Create job description and submit
input_desc = {
        "pdbfile": {
            "class": "File",
            "location": pdb_uri
            },
        "time": 0.0001
        }

job_desc = JobDescription(
        name='example_job',
        workflow=workflow_uri,
        input=input_desc
        )

job = srv.jobs.post_job(body=job_desc).result()

print('[' + time.ctime() + '] Job created')

# Wait for it to finish
while job.state == 'Running' or job.state == 'Waiting':
    time.sleep(10)
    job = srv.jobs.get_job_by_id(jobId=job.id).result()
    print('[' + time.ctime() + "] Current state: " + str(job.state))

# Download results
if job.state == 'Success':
    print('[' + time.ctime() + '] Job ran successfully')
    traj_uri = job.output['trajectory']['location']
    trajectory = requests.get(traj_uri).content
    with open('1qm3.trr', 'wb') as traj_file:
        traj_file.write(trajectory)
    print('Output saved as 1qm3.trr')
else:
    print('[' + time.ctime() + '] There was an error.')

gromit_out_uri = job.output['gromitout']['location']
gromit_out = requests.get(gromit_out_uri).text
with open('gromit_out.txt', 'w') as gromit_out_file:
    gromit_out_file.write(gromit_out)
print('Gromit output saved as gromit_out.txt')

# Get the log manually, because Bravado doesn't understand
# non-JSON responses
job_log = requests.get(srv_loc + '/jobs/' + job.id + '/log').text
with open('example_job_log.txt', 'w') as job_log_file:
    job_log_file.write(job_log)
print('Job log saved as example_job_log.txt')
