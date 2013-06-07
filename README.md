cd-pipeline
===========

Gerrit/Jenkins CD Pipeline

```
git clone cd-pipeline
cd cd-pipeline/chef-repo
bundle install --path=vendor/bundle
bundle exec berks install --path=cookbooks
knife upload .


```

```
# change dns for review.FOO.can.cd and jenkins.FOO.can.cd

bundle exec knife hp server create -f 101 -I 75839 -S hptesting-az1 -i ~/.ssh/hptesting-az1.pem -x ubuntu -r 'role[jenkins]' -VV
```

```
todo / currently manual
knife org create
modify jenkins role and the end node with:
org validator-name
org validator-key
org-admin jenkins-client-name 
org-admin jenkins-client-key
initial .gitremote
setup first gerrit admin... associate users with openid providers?
set gerrit:
Full Name
Email
username: jenkins
register ssh pubkeys for gerrit2,jenkins users with jenkins user on Gerrit webui


ref/* Push Allow Admin
ref/* Create Reference Admin
```