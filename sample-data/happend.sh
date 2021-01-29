#!/bin/bash

#script to download holey hadiths from sunnah.com

address=$1
#echo $address
hadith=$(qsel $address ".hadith_narrated, .text_details")
#echo $hadith
hadithescaped=$(echo $hadith | sed 's/"/\\"/g')
reference=$(qsel $address "table.hadith_reference > tr" -T "\"ref{{index|incr}}\": \"{{.|text}}\"," --limit 3)
#reference=$(echo $reference | sed '$s/,$//')
#echo $reference
keywords="\"keywords\":[\"dummy\", \"dummy\", \"dummy\"]"

compilation="{\"type\":\"hadith\", \"url\":\"$address\", \"text\":\"$hadithescaped\", $reference $keywords}"
#echo $compilation

echo $compilation | jq '.'

final=$(cat test.json | jq ".+= [$compilation]")

echo $final | jq '.' > test.json
