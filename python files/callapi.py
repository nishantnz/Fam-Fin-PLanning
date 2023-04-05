import requests
url="http://127.0.0.1:12345/predict"
json_data = [[2]]
resp = requests.post(url=url,json=json_data)
print(resp.status_code)
print(resp.text)