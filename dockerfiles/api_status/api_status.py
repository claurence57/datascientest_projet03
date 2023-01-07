import os
import requests

LOG_DIR='/projet3/result/'
LOG_FILE='api_status.log'

api_address = 'fastapi'
api_port =  8000

r = requests.get(
   url = 'http://{address}:{port}/status'.format(address=api_address, port=api_port),
)

output = '''
========================================
   Projet3 API availability test
========================================

request done at "/status"

expected result = 200
actual result = {status_code}

==> {test_status}

'''

status_code = r.status_code

if status_code == 200:
    test_status = 'SUCCESS'
else:
    test_status = 'FAILURE'

print(output.format(status_code=status_code, test_status=test_status))

if os.environ.get('LOG') == 'yes':
   print('Writing output to file:' + LOG_DIR + LOG_FILE)
   with open(LOG_DIR + LOG_FILE, 'a') as file:
      file.write(output.format(status_code=status_code, test_status=test_status))
   file.close()

