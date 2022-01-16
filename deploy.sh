#!/bin/bash

git submodule update --remote --recursive
hugo
exit 0
