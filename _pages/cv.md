---
layout: page
permalink: /cv/
title: CV
description: 
years: [2016,2013,2012,2011,2010,2009,2008,2007]
---

Employment
==========

**2018&ndash;**: Associate Professor, Niels Bohr Institute, University of Copenhagen

**2013&ndash;2018**: ESA/AURA Astronomer, STScI, Baltimore, Maryland

**2010&ndash;2013**: Fellow, European Southern Observatory (ESO), Santiago, Chile

**2002&ndash;2004**: Data Analyst, STScI, Baltimore, Maryland

Education
=========

**2010**: Ph.D. (Astronomy), Yale University, New Haven, Connecticut

*2008*: U.S. Fulbright Fellow, Chile, Universidad de Chile

**2006**: M.Phil. (Astronomy), Yale University

**2006**: M.Sc. (Astronomy), Yale University

**2002**: B.S. (Astrophysics), Williams College, Williamstown, Massachusetts

*2001*: NSF-REU Student, CTIO, La Serena, Chile


Publications
============

Selected publications below.  Full ADS query [here](https://ui.adsabs.harvard.edu/search/p_=0&q=brammer%2C%20g&sort=citation_count%20desc%2C%20bibcode%20desc).

{% for y in page.years %}
  <h3 class="year">{{y}}</h3>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}
