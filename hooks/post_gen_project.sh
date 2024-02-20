#!/bin/bash

make phoenix-create app_name={{cookiecutter.project_slug}}
sed -i \
    's/hostname: "localhost",/hostname: "{{cookiecutter.project_slug}}-phoenix-db",/g' \
    app/{{cookiecutter.project_slug}}/config/dev.exs
sed -i \
    's/database: "{{cookiecutter.project_slug}}_dev",/database: "{{cookiecutter.project_slug}}-phoenix",/g' \
    app/{{cookiecutter.project_slug}}/config/dev.exs
sed -i \
    's/http: \[ip: {127, 0, 0, 1}, port: 4000\],/http: \[ip: {0, 0, 0, 0}, port: 4000\],/g' \
    app/{{cookiecutter.project_slug}}/config/dev.exs
