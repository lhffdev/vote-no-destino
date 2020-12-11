#!/bin/bash
docker-compose up -d frontend
docker-compose exec frontend yarn run start --host 0.0.0.0
