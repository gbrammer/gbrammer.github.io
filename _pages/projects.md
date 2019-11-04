---
layout: page
title: projects
permalink: /projects/
description: Research projects and collaborations
---

{% assign ordered_pages = site.projects | sort:"order_number" %}

{% for project in ordered_pages %}

{% if project.redirect %}

<div class="project">
    <div class="project_thumbnail">
        <a href="{{ project.redirect }}" target="_blank">
        {% if project.img %}
        <img class="aligned_image" src="{{ project.img | prepend: site.baseurl | prepend: site.url }}"/>
        {% else %}
        <div class="project_thumbnail blankbox"></div>
        {% endif %}   
        </a>
    </div>
    <div class="project_text">
        <a href="{{ project.redirect }}" target="_blank">
        <span>
            <h3>{{ project.title }}</h3>
            <p>{{ project.description }}</p>
        </span>
        </a>
    </div>
</div>

{% else %}

<div class="project ">
    <div class="project_thumbnail">
      <a href="{{ project.url | prepend: site.baseurl | prepend: site.url }}">
        {% if project.img %}
        <img class="aligned_image" src="{{ project.img | prepend: site.baseurl | prepend: site.url }}"/>
        {% else %}
        <div class="thumbnail blankbox"></div>
        {% endif %}    
      </a>
    </div>
    <div class="project_text">
      <a href="{{ project.url | prepend: site.baseurl | prepend: site.url }}">
        <span>
            <h3>{{ project.title }}</h3>
            <p>{{ project.description }}</p>
        </span>
      </a>
    </div>
</div>

{% endif %}

{% endfor %}
