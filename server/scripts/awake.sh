#!/usr/bin/env bash

# Initialize config.lua
./scripts/init_config_lua.sh

# Initialize database
./scripts/init_database.sh

# We do not auto-restart here, it will be handled by manager
./otserv
