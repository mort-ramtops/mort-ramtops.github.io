#!/bin/bash

#script to list some info about the hadith json

final=$(cat data.json | jq ". | length")

echo "data.json"
echo "Number of hadiths: $final"
