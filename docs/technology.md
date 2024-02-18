# Technology

We use [cookiecutter](https://cookiecutter.readthedocs.io/) to generate this project and use it as template for other phoenix projects.

`Cookiecutter` is a `Python` application so, we need install `Python` and `pip` to install it. I recommend to use [asdf](https://asdf-vm.com/) to install everything.

## Install python with asdf

    sudo aptitude install zlib1g-dev libffi-dev
    asdf plugin add python
    asdf local install python latest:3.10
    asdf local python 3.10

## Install Cookiecutter

    pip install cookiecutter

## Use Cookiecutter

[Cookiecutter](https://cookiecutter.readthedocs.io/) is an utility to create the scaffolding of a project.

Follow [this tutorial](https://cookiecutter.readthedocs.io/en/stable/tutorials/tutorial2.html) to create the cookiecutter project.