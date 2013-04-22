Argue App
=========
A work in progress. A bit disjointed at the moment.

Setup
-----
`git submodule init`

`git submodule update`

`gem install json haml sinatra data_mapper sqlite dm-serializer`

`ruby init.rb`

Importing Scenarios and Users
-----------------------------
To add a scenario, issue a `PUT` request in JSON.. ex:
`cd argue-app/tools/scenarios`
`curl -vH "Content-Type: application/json" -X PUT --data "@industrialists.json" http://localhost:4567/scenario/industrialists`

To add a scenario, issue a `PUT` request in JSON.. ex:
`cd argue-app/tools/useris`
`curl -vH "Content-Type: application/json" -X PUT --data "@mil.json" http://localhost:4567/user/666`

Where you can `PUT` you can also `GET` back the JSON after its been stored. The eventual plan is for full REST.

Login System
-------------
Given a user is added `http://localhost:4567/login` is a form for login.
If you curl'd  the mil.json file as described earlier above, then you can log in with mil and 666.

App Scenarios
-------------
Given a scenario is added, `http://locahost:4567/scenarioId` can be used to view the scenario UI.
If you curl'd the industrialists.json file above you can go to `http://localhost:4567/industrialists`.
