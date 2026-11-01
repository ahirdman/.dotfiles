#!/bin/bash
grep "user:" ~/.config/gh/hosts.yml 2>/dev/null | awk '{print $2}' | head -1
