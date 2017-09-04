import os
import requests
import time
from bravado.client import SwaggerClient

# Create a client for the REST API
srv_loc = 'http://localhost:29593'
srv = SwaggerClient.from_url(srv_loc + '/swagger.json')
JobDescription = srv.get_model('job-description')

# Make a directory to store the input for this job
filestore = 'http://localhost:29593/files'
requests.request('MKCOL', filestore + '/input/example_job')

# Upload files
workflow_uri = filestore + '/input/example_job/md_workflow.cwl'
with open('md_workflow.cwl', 'rb') as workflow_file:
    requests.put(workflow_uri, data=workflow_file.read())

protein_pdb_uri = filestore + '/input/example_job/CYP19A1vs.pdb'
with open('CYP19A1vs.pdb', 'rb') as pdb_file:
    requests.put(protein_pdb_uri, data=pdb_file.read())

protein_top_uri = filestore + '/input/example_job/CYP19A1vs.top'
with open('CYP19A1vs.top', 'rb') as top_file:
    requests.put(protein_top_uri, data=top_file.read())

protein_itp_uri = filestore + '/input/example_job/CYP19A1vs-posre.itp'
with open('CYP19A1vs-posre.itp', 'rb') as itp_file:
    requests.put(protein_itp_uri, data=itp_file.read())

ligand_pdb_uri = filestore + '/input/example_job/BHC89.pdb'
with open('BHC89.pdb', 'rb') as pdb_file:
    requests.put(ligand_pdb_uri, data=pdb_file.read())

ligand_top_uri = filestore + '/input/example_job/BHC89_GMX.itp'
with open('BHC89.itp', 'rb') as itp_file:
    requests.put(ligand_top_uri, data=itp_file.read())

ligand_itp_uri = filestore + '/input/example_job/BHC89-posre.itp'
with open('BHC89-posre.itp', 'rb') as itp_file:
    requests.put(ligand_itp_uri, data=itp_file.read())


# Create job description and submit
input_desc = {
        "protein_pdb": {
            "class": "File",
            "location": protein_pdb_uri
            },
        "protein_top": {
            "class": "File",
            "location": protein_top_uri
            },
        "protein_itp":{
            "class": "File",
            "location": protein_itp_uri,
            "basename": "CYP19A1vs-posre.itp"
            },
        "ligand_pdb": {
            "class": "File",
            "location": ligand_pdb_uri
            },
        "ligand_top": {
            "class": "File",
            "location": ligand_top_uri
            },
        "ligand_itp": {
            "class": "File",
            "location": ligand_itp_uri,
            "basename": "BHC89-posre.itp"
            },
        "force_field": "amber99SB",
        "sim_time": 0.0001
        }

job_desc = JobDescription(
        name='example_job',
        workflow=workflow_uri,
        input=input_desc
        )

job = srv.jobs.post_job(body=job_desc).result()

print('[' + time.ctime() + '] Job created with id ' + job.id)

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
    with open('CYP19A1_BHC89.trr', 'wb') as traj_file:
        traj_file.write(trajectory)
    print('Output saved as CYP19A1_BHC89.trr')
else:
    print('[' + time.ctime() + '] There was an error.')

# Get the log manually, because Bravado doesn't understand
# non-JSON responses
job_log = requests.get(srv_loc + '/jobs/' + job.id + '/log').text
with open('example_job_log.txt', 'w') as job_log_file:
    job_log_file.write(job_log)
print('Job log saved as example_job_log.txt')

# get gromit output
gromit_out_uri = job.output['gromitout']['location']
gromit_out = requests.get(gromit_out_uri).text
with open('gromit_out.txt', 'w') as gromit_out_file:
    gromit_out_file.write(gromit_out)
print('Gromit output saved as gromit_out.txt')

# get gromacs output
gromacs_log_uri = job.output['gromacslog']['location']
gromacs_log = requests.get(gromacs_log_uri).text
with open('gromacs.log', 'w') as gromacs_log_file:
    gromacs_log_file.write(gromacs_log)
print('Gromacs output saved as gromacs.log')
