# Cookiecutter Phoenix

The aim of this project is to create a template which I can use to create every phoenix project without pain.

Read documentation about [technology](./docs/technology.md) to know how this is done.

## Usage

Execute:

    asdf local python latest:3.10

to use the latest version of python 3.10 and then execute:

    cookiecutter gh:sblancov/cookiecutter-phoenix

And then you have to change your directory to go into the project directory called as you have picked when you select the project slug option.

And you can run a development environment executing:

    make up

and then go to http://localhost:4000/ to run the phoenix application.


Behind the scenes, Docker is used, so you need to install it.

Do not forget to stop it when you leave to work:

    make down

Happy coding!
