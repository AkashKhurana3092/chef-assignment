# windows

This cookbook is intended to change windows security policies, user privilege and registry key as per windows server security remediation 

All the attributes set in the recipies can be found under windows/attributes/default.
Any changes to registry key should be done in attribute file

Recipe/default.rb
It contains the set of recipies to be executed, to set windows as per remediation policy

Plicyfile.rb
It contains the run_list to be executed as part of converge

Test/integration/default
Contains all the test cases written as per remediation. If all test passes, then the windows policies are set as per expectation.

