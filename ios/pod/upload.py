import requests
import sys
import base64
import json
import os
# upload file to github
workdir = sys.argv[0][:sys.argv[0].rfind("/")]
githubToken = os.environ["GITHUB_TOKEN"]

owner = "Caijinglong"
repo = "flutter_ijkplayer_pod_spliter"
version = os.environ["VERSION"]

def get_basic_auth_str(username, password):
    temp_str = username + ':' + password
    bytesString = temp_str.encode(encoding="utf-8")
    encodestr = base64.b64encode(bytesString)
    decodestr = base64.b64decode(encodestr)
    return 'Basic ' + encodestr.decode()


with open(f'{workdir}/../output/files') as f:
    files = f.readlines()


def upload_file(path: str):
    fp = f'{workdir}/../output/{path}'
    print(f'handle {fp}')
    with open(fp, 'rb') as f:
        buf = f.read()
        content = base64.encodebytes(buf).decode("utf-8")
    data = {"message": "Upload for python script",
            "content": content,
            "branch": version, }

    dumpData = json.dumps(data)

    response = requests.put(
        f"https://api.github.com/repos/{owner}/{repo}/contents/{path}", dumpData, headers={
            "Authorization": get_basic_auth_str("Caijingong", githubToken)
        })

    print(f'upload {path} result: {response.text}')


def create_branch():
    url = f"repos/{owner}/{repo}/branches"
    data = {
        "refs": "master",
        "branch_name": version,
    }
    dumpData = json.dumps(data)
    response = requests.post(
        f"https://api.github.com/{url}", dumpData, headers={
            "Authorization": get_basic_auth_str("Caijingong", githubToken)
        })
    print(f"create branch result: {response.text}")
    pass


# create_branch()

# upload_file('README.md')
# upload_file('README.tar.gz')

for file_path in files:
    # upload_file(file_path.strip())
    pass

# make shell content
shell_str = ""

for file_path in files:
    shell_str = shell_str + \
        f'wget "https://cdn.jsdelivr.net/gh/CaiJingLong/flutter_ijkplayer_pod_spliter@{version}/{file_path.strip()}\n'
    pass

shell_str += "cat IJKMediaFramework.tar.xz.* > IJKMediaFramework.tar.xz\n"
shell_str += "tar xvf IJKMediaFramework.tar.xz\n"
shell_str += "rm IJKMediaFramework.tar.xz.* IJKMediaFramework.tar.xz\n"

with open(f'{workdir}/podspec.template') as pod_file:
    content_str = pod_file.read()
    content_str = content_str % (version)

with open(f'{workdir}/FlutterIJK.podspec', 'w') as out_file:
    out_file.write(content_str)
