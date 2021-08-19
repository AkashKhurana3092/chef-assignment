# chef-assignment

This repo contains the 3 cookbooks named as mongodb, Tomcat_install and windows.

Each cookbooks is configured to run its own set of action ie installing mongodb, Tomcat or setting up remediation as per windows benchmark.

**Instructions to execute cookbooks**

In order to execute the cookbook, first clone it in your local machine by running command 
## git clone https://github.com/AkashKhurana3092/chef-assignment.git

 # Testing Tomcat_install

This cookbook is tested with kitchen utility ( for more details follow https://kitchen.ci/ )

The tomcat cookbook is tested with dokken driver and image centos-8 ( before running converge, make sure you have installed you have docker in local machine and verify using docker ps command )

Tomcat has set of recipes which will be executed as part of kitchen converge ie https://github.com/AkashKhurana3092/chef-assignment/tree/main/Tomcat_install/recipes

***Resources Used and Details ***

remote_file : https://docs.chef.io/resources/remote_file/

archive_file: https://docs.chef.io/resources/archive_file/

bash : https://docs.chef.io/resources/bash/

package: https://docs.chef.io/resources/package/

file : https://docs.chef.io/resources/file/

service: https://docs.chef.io/resources/service/

## Steps to test the cookbook
1) Go to directory where your kitchen.yml is present
2) Run "kitchen create" command, which will invoke your dokken driven and will configure the system with centos-8 image 
3) Now once you have image ready, run "kitchen converge". It will install the chef-client in machine, creates Policyfile.lock and then starts compilation of chef cookbooks ( reference: https://kitchen.ci/docs/getting-started/running-converge/ )
4) Once your cookbook is applied. To see the if the output from converge is expected or not , please run the test cases against that node with "kitchen verify" (refernce: https://kitchen.ci/docs/getting-started/running-verify/ )
5) After the testing is done, do "kitchen login" and you can also run manual commands to test tomcat like curl localhost:8080 and other
6) At the end please run "kitchen destroy" to remove the machine 


# Testing mongodb

This cookbook is tested with kitchen utility ( for more details follow https://kitchen.ci/ )

The mongodb cookbook is tested with dokken driver and image centos-8 ( before running converge, make sure you have installed you have docker in local machine and verify using docker ps command )

Mongodb has set of recipes which will be executed as part of kitchen converge ie ( https://github.com/AkashKhurana3092/chef-assignment/tree/main/mongodb)

***Resources Used and Details ***

yum_repository: https://docs.chef.io/resources/yum_repository/

package: https://docs.chef.io/resources/package/

service: https://docs.chef.io/resources/service/

## Steps to test the cookbook
1) Go to directory where your kitchen.yml is present
2) Run "kitchen create" command, which will invoke your dokken driven and will configure the system with centos-8 image 
3) Now once you have image ready, run "kitchen converge". It will install the chef-client in machine, creates Policyfile.lock and then starts compilation of chef cookbooks ( reference: https://kitchen.ci/docs/getting-started/running-converge/ )
4) Once your cookbook is applied. To see the if the output from converge is expected or not , please run the test cases against that node with "kitchen verify" (refernce: https://kitchen.ci/docs/getting-started/running-verify/ )
5) After the testing is done, do "kitchen login" and you can also run manual commands to test Mongodb like mongod to invoke db
6) At the end please run "kitchen destroy" to remove the machine 


# Testing windows

This cookbook is tested with kitchen utility ( for more details follow https://kitchen.ci/ )

The windows cookbook is tested with vagrant and virtualbox. As, there is no image of windows present with dokken driver. Once can also use the ec2 driver and specify the image for window. **Due to limitation, I have used the vagrant machine and virtaul box to test the windows cookbook**

# You can select the windows image for vagrant from ( https://app.vagrantup.com/tas50 )

Mongodb has set of recipes which will be executed as part of kitchen converge ie ( https://github.com/AkashKhurana3092/chef-assignment/tree/main/windows)

***Resources Used and Details ***

windows_user_privilege : https://docs.chef.io/resources/windows_user_privilege/

windows_security_policy : https://docs.chef.io/resources/windows_security_policy/

registry_key : https://docs.chef.io/resources/registry_key/

chef inspec: https://docs.chef.io/inspec/glossary/

## Steps to test the cookbook
1) Go to directory where your kitchen.yml is present
2) Run "kitchen create" command, which will invoke your vagrant driven and will configure the system with tas/windows_2019
3) Now once you have image ready, run "kitchen converge". It will install the chef-client in machine, creates Policyfile.lock and then starts compilation of chef cookbooks ( reference: https://kitchen.ci/docs/getting-started/running-converge/ )
4) 4) Once your cookbook is applied. To see the if the output from converge is expected or not , please run the test cases against that node with "kitchen verify" (refernce: https://kitchen.ci/docs/getting-started/running-verify/ )
5) You will also the machine created in virtualbox and can login to verify manually if all expected changes are done to windows machine
6) At the end please run "kitchen destroy" to remove the machine 
