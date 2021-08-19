# Tomcat_install

This cookbook is used to install the Tomcat on centos

recipes/default.rb
It conatins the set of recipes to be executed for installation of Tomcat server on centos machine

The recipe is written to get tomcat package in file_cache_path and then with the resources installation takes place.

attributes/default
It contains all the attributes used in recipe.This is basically used to make cookbook more flexible in case of changes. if anyone intended to change the settings, try to make use of attribute file

Plicyfile.rb
It contains the run_list for the recipe. It also contains the default path from where the external cookbook is expected to be fetched.

Templates/default
It contains the templates to be used in run time for configuration of tomcat server. It is basically the erb file.

test/integration/default
It contains the test cases, which will verify if the outcome is expected value or not

Metadata.rb
It conatins the versioning of cookbook, author name, cookbook name and all dependencies are to be mentioned here


