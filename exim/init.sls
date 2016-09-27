{%- from "exim/map.jinja" import exim with context -%}

exim-package:
  pkg.installed:
    - name: {{ exim.package }}

exim-service:
  service.running:
    - name: {{ exim.service }}
    - enable: True

exim-reload:
  module.wait:
    - name: service.reload
    - m_name: {{ exim.service }}

exim-restart:
  module.wait:
    - name: service.restart
    - m_name: {{ exim.service }}
