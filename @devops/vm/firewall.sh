#!/usr/bin/env bash

iptables-restore < iptables.rules

printf 'IP Tables rules loaded!\n'