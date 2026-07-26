---
layout: compress
permalink: '/:path/swconf.js'
# This file is fetched by the service worker and must not be cached.
---

const swconf = {
  {% if site.pwa.cache.enabled %}
    cacheName: 'chirpy-{{ "now" | date: "%s" }}',

    {%- comment -%} Cache each tab URL only once. The home tab already uses "/". {%- endcomment -%}
    {% assign tab_urls = site.tabs | map: 'url' | uniq %}
    resources: [
      '{{ "/assets/css/:THEME.css" | replace: ':THEME', site.theme | relative_url }}',
      {% unless tab_urls contains '/' %}
        '{{ "/" | relative_url }}',
      {% endunless %}
      {% for tab_url in tab_urls %}
        '{{- tab_url | relative_url -}}',
      {% endfor %}

      {% assign cache_list = site.static_files | where: 'swcache', true %}
      {% for file in cache_list %}
        '{{ file.path | relative_url }}'{%- unless forloop.last -%},{%- endunless -%}
      {% endfor %}
    ],

    interceptor: {
      paths: [
        {% for path in site.pwa.cache.deny_paths %}
          {% unless path == empty %}
            '{{ path | relative_url }}'{%- unless forloop.last -%},{%- endunless %}
          {% endunless %}
        {% endfor %}
      ],
      urlPrefixes: [
        {% if site.analytics.goatcounter.id != nil and site.pageviews.provider == 'goatcounter' %}
          'https://{{ site.analytics.goatcounter.id }}.goatcounter.com/counter/'
        {% endif %}
      ]
    },

    purge: false
  {% else %}
    purge: true
  {% endif %}
};
