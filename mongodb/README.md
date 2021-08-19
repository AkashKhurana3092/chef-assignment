# mongodb

This cookbook is intended to install mongodb on centos machine.

recipes/default.rb
It conatins the set of recipes to be executed for installation of mongodb on centos machine.
The recipes also takes care of configuring yum repos, so that mongo package can be installed.

attributes/default
It contains all the attributes used in recipe.This is basically used to make cookbook more flexible in case of changes. if anyone intended to change the settings, try to make use of attribute file

Plicyfile.rb
It contains the run_list for the recipe. It also contains the default path from where the external cookbook is expected to be fetched.

test/integration/default
It contains the test cases, which will verify if the outcome is expected value or not

Metadata.rb
It conatins the versioning of cookbook, author name, cookbook name and all dependencies are to be mentioned here