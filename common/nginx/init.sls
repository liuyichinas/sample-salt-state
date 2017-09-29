nginx:
  pkg:
    - installed
  service.running:
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      #- file: /etc/nginx/sites-available/default

/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://common/nginx/nginx.conf
    - user: root
    - group: root
    - mode: 640
