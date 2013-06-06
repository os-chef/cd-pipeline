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
bundle exec knife hp server create -f 101 -I 75839 -S hptesting-az1 -i ~/.ssh/hptesting-az1.pem -x ubuntu -r 'role[jenkins]' -VV
```

```todo / currently manual
knife org create
modify jenkins role and the end node with:
org validator-name
org validator-key
org-admin jenkins-client-name 
org-admin jenkins-client-key
```