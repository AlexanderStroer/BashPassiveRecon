#!/bin/bash

# Prompt user for domain name
read -p "Enter a domain name including the suffix: " domain_name

# Create new directory for output files
output_dir="$PassiveReconOutput"
mkdir -p "$output_dir"


# Run whois/dig/nslookup
whois $domain_name > "$output_dir/$domain_name/$domain_name-whois.txt"
dig $domain_name > "$output_dir/$domain_name/$domain_name-dig.txt"
nslookup $domain_name > "$output_dir/$domain_name/$domain_name-nslookup.txt"
theHarvester -d $domain_name -l 20 -b bing > "$output_dir/$domain_name/$domain_name-harvested.txt"
sublist3r -d $domain_name > "$output_dir/$domain_name/$domain_name-sublist3r.txt"


# Create HTML file and write output to it
echo "<html><head><title>WHOIS information for $domain_name</title></head><body><pre>" > $output_dir/$domain_name/$domain_name-whois.html
cat $output_dir/$domain_name/$domain_name-whois.txt >> $output_dir/$domain_name/$domain_name-whois.html
echo "</pre></body></html>" >> $output_dir/$domain_name/$domain_name-whois.html

echo "<html><head><title>dig information for $domain_name</title></head><body><pre>" > $output_dir/$domain_name/$domain_name-dig.html
cat $output_dir/$domain_name/$domain_name-dig.txt >> $output_dir/$domain_name/$domain_name-dig.html
echo "</pre></body></html>" >> $output_dir/$domain_name/$domain_name-dig.html

echo "<html><head><title>harvested information for $domain_name</title></head><body><pre>" > $output_dir/$domain_name/$domain_name-nslookup.html
cat $output_dir/$domain_name/$domain_name-nslookup.txt >> $output_dir/$domain_name/$domain_name-nslookup.html
echo "</pre></body></html>" >> $output_dir/$domain_name/$domain_name-nslookup.html

echo "<html><head><title>harvested information for $domain_name</title></head><body><pre>" > $output_dir/$domain_name/$domain_name-harvested.html
cat $output_dir/$$domain_name/domain_name-harvested.txt >> $output_dir/$domain_name/$domain_name-harvested.html
echo "</pre></body></html>" >> $output_dir/$domain_name/$domain_name-harvested.html

echo "<html><head><title>harvested information for $domain_name</title></head><body><pre>" > $output_dir/$domain_name/$domain_name-sublist3r.html
cat $output_dir/$domain_name/$domain_name-sublist3r.txt >> $output_dir/$domain_name/$domain_name-sublist3r.html
echo "</pre></body></html>" >> $output_dir/$domain_name/$domain_name-sublist3r.html

# Clean up
rm $output_dir/$domain_name/$domain_name-whois.txt
rm $output_dir/$domain_name/$domain_name-dig.txt
rm $output_dir/$domain_name/$domain_name-nslookup.txt
rm $output_dir/$domain_name/$domain_name-harvested.txt
rm $output_dir/$domain_name/$domain_name-sublist3r.txt

# Display confirmation message
echo "whois info for $domain_name saved to the folder $output_dir/$domain_name"
echo "dig info for $domain_name saved to the folder $output_dir/$domain_name"
echo "nslookup info for $domain_name saved to the folder $output_dir/$domain_name"
echo "theHarvester info for $domain_name saved to the folder $output_dir/$domain_name"
echo "sublist3r info for $domain_name saved to the folder $output_dir/$domain_name"
