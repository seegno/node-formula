{% from "node/map.jinja" import node with context %}

node-install-pm2:
  cmd.run:
    - name: npm instal -g pm2@{{ node["pm2"]["version"] }}
    - cwd: /tmp

node-symlink-pm2:
  file.symlink:
    - name: /usr/local/bin/pm2
    - target: /usr/local/node/bin/pm2
    - require:
      - file: node-install-pm2

