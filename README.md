Overview
========
Bird Registry: Basic HTTP service with a JSON API. It will support the following requests:

 - `GET /apis/birds.json` - List all birds
 - `POST /apis/birds.json` - Add a new bird
 - `GET /apis/birds/{id}.json` - Get details of a specific bird
 - `DELETE /apis/birds/{id}.json` - Delete a bird by id

Technologies
============
 - Language: Ruby 2.2.1p85
 - Framework: Rails 4.2.2
 - Database: MongoDB

API specification
=================

List all birds
--------------
Only visible birds should be returned.

## Request `GET /apis/birds.json`

## Response

Valid status codes:

 - `200 OK`

Add bird
--------

## Request `POST /apis/birds.json`

## Response

Valid status codes:

 - `201 Created` if the bird was successfully added
 - `400 Bad request` if any mandatory fields were missing or if the input JSON was invalid

Get bird by id
--------------

## Request `GET /apis/birds/{id}.json`

## Response

Valid status codes:

 - `200 OK` if the bird exists
 - `404 Not found` if the bird does not exist

Delete bird by id
-----------------

## Request `DELETE /apis/birds/{id}.json`

## Response

Valid status codes:

 - `200 OK` if the bird has been removed
 - `404 Not found` if the bird didn't exist

How to setup
============

 - $ cd ~/workspace
 - $ git clone https://github.com/sreerajsomarajan/bird-registry.git
 - $ cd bird-registry
 - $ bundle install --without production

Test Spec
=========

 - List all birds: rspec spec/requests/birds_spec.rb:27
 - Add bird: rspec spec/requests/birds_spec.rb:38
 - Get bird by id: rspec spec/requests/birds_spec.rb:51
 - Delete bird by id: rspec spec/requests/birds_spec.rb:60
 - Check validation error on creation: rspec spec/requests/birds_spec.rb:67

