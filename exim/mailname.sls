{%- from "exim/map.jinja" import exim with context -%}

{%- set mailname = salt['pillar.get'](
  'exim:mailname',
  salt['grains.get']('fqdn'))
-%}

include:
  - exim

exim-mailname:
  file.managed:
    - name: {{ exim.mailname_file }}
    - contents: {{ mailname }}
    - watch_in:
      - module: exim-reload
