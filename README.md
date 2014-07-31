# Justask

[Staging Environment](http://www.davidjconnolly.com/)

In just about every software problem I've encountered, I always see room for improvement in quickly gathering feedback on or answering a set of questions about a new product feature.  I thought it would be fun to make a basic survey tool to help solve this problem as well as provide a test bed for several technologies I've been wanting to explore.

## Proposed Stack
* Rails 4 backend
* [Postageapp](http://postageapp.com/) to e-mail out surveys
* Store questions/responses in schemaless JSON columns in Postgres 9.4 to allow the question types to be easily stored/extended while being fast enough to do analytics
* Admin Frontend
  * Start with a straight HAML/Bootstrap/JS then enhance it to use Angular.js
  * TBD dashboard library to view responses
* Survey User Frontend
  * jQuery Mobile to provide a simple UI that can be viewed on any device

## Configuration Steps:
1. Create config/database.yml
