#!/bin/bash
echo "Reseting database"
rake db:all
rake db:all RAILS_ENV=development