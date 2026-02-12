# vanr

Landing page based on [Jekyll](https://jekyllrb.com).

---

Developing the website expects `make`, Docker and the Docker compose plugin to be installed.

## Installing dependencies

Before running any command, build Docker images and install Ruby Gems using

```console
make setup
```

## Running a development server

Start a development server on <http://localhost:4000>

```console
make up
```

## Build production assets

The command will build a production ready version of the site in `./dist`

```console
make build
```

---

## License

Unless noted otherwise, all original source code in this repository is licensed under the [MPL-2.0 license](./LICENSE).
However, this license does not apply to content like images or website copy, where all rights are reserved.
