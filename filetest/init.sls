file-test:
  file.managed:
    - name: /tmp/filetest.txt
    - source: salt://filetest/1.txt
    - user: root
    - group: root
    - mode: 644
