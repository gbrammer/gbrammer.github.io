#!/bin/bash

# Use this in the first test line of a notebook, with the blank line 

HEADER="""
---
layout: post
title:  Red sources around the z=7.54 quasar ULAS J1342+0928
date:   2019-11-15 15:47:08 +0100
categories: research alma charge

---
"""

usage="""
Usage:

1) Copy a notebook to this directory.

3) Run the command below, where the last item is a list of jekyll properties
   to aattach to the post.
   
   ./update_post.sh this-is-a-new-post.ipynb \"research alma charge\"
   
"""

nbfile=$1
categories=$2

date_timestamp=`date -r ${nbfile} +'%Y-%m-%d'`
full_timestamp=`date -r ${nbfile} +'%Y-%m-%d %H:%M:%S %z'`

echo $nbfile
#echo $date_timestamp
#echo $full_timestamp

echo "print('${nbfile}'.strip('.ipynb').replace('-',' ').title())" > /tmp/title.py
title=`python /tmp/title.py`
echo $title

#echo $categories
rm -rf ./tmp
jupyter nbconvert --to markdown ${nbfile} --output-dir ./tmp

root=`echo $nbfile | sed "s/.ipynb//"`
echo $root

rm -rf ../assets/post_files/${root}_files
cp -R ./tmp/${root}_files ../assets/post_files/
outfile="${date_timestamp}-${root}.md"

#echo """---
#layout: post
#title:  "${title}"
#date:   2019-11-15 15:47:08 +0100
#categories: research alma charge
#---""" > $outfile
 

head -n 9 tmp/${root}.md | tail -8 > ${outfile}
echo "" >> ${outfile} 
echo "(This page is auto-generated from the Jupyter notebook [${root}.ipynb](/assets/post_files/${root}.ipynb).)" >> ${outfile} 
echo "" >> ${outfile} 
echo "======" >> ${outfile} 
echo "" >> ${outfile} 

tail -n +12 tmp/${root}.md >> ${outfile}

cp ${root}.ipynb ../assets/post_files/


perl -pi -e "s/${root}_files/\/assets\/post_files\/${root}_files/" $outfile

mv ${outfile} ../_posts
rm -rf ./tmp
