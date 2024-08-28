load('config.star', 'get_settings')
settings = get_settings()

image_base_os_version = '5.6.0-11'

if settings.get('devMode'):
  devMode = 'true'
else:
  devMode = 'false'

def build_main_service(arm_url, arm_repo):
  # ---------- Assurance Search Service -------------
  docker_build(
    arm_url + '/' + arm_repo + '/eric-oss-network-assurance-search', # image name
    '.', # base path for docker build
    dockerfile='./docker/Dockerfile',
    entrypoint='./entrypoint.sh -d',
    ignore=['mock'],
    build_args={'DEV': devMode, 'BASE_OS_VERSION': image_base_os_version},
    live_update=[
      fall_back_on(['backend/package.json']),
      sync('backend', '/runtime/server'),
      #run('cd /runtime/server && npm install', trigger=['backend/package.json']), # does not work due to user right issues - TODO fix
    ]
  )
