# Ansible Role Template

iManage Security Operations
<secops@imanage.com>

# Meta

There's one file used here: main.yml

# Sample File

```
---
###############################################################################
#
# meta/main.yml
#
# Ansible Galaxy package metadata file for tanium-client
#
###############################################################################

galaxy_info:
  role_name: tanium-client
  author: iManage Security Operations <secops@imanage.com>
  description: Tanium Client
  company: iManage, LLC
  license: BSD
  min_ansible_version: 2.4
  issue_tracker_url: http://git.ch3.imanage.work/secops/secops/issues
  platforms:
    - name: 'Ubuntu'
      versions:
        - 'trusty' # 14.04
        - 'xenial' # 16.04
        - 'bionic' # 18.04
        - 'focal' # 20.04
    - name: 'Debian'
      versions:
        - 'buster' # 10
        - 'stretch' # 9
        - 'jessie' # 8
    - name: 'EL'
      versions:
        - '8'
        - '7'
        - '6'
    - name: 'Amazon'
      versions:
        - '2018.03'
  galaxy_tags:
    - 'development'
    - 'system'
    - 'packaging'
```
