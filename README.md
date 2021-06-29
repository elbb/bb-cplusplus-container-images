<img src="https://raw.githubusercontent.com/elbb/bb-buildingblock/master/.assets/logo.png" height="200">

# (e)mbedded (l)inux (b)uilding (b)locks - containerized C++ build and runtime environment

This building block provides a way to build of any C++ project in a containerized manner and offers:

-   C++ builder docker image
-   C++ runtime docker image
-   local and CI/CD build system

## Prerequisites

-   [docker](https://docs.docker.com/install/)
-   [dobi](https://github.com/dnephin/dobi) (downloaded if not in `PATH`)
-   [concourse](https://concourse-ci.org/) (ci/cd)

## Usage

Have a look into [bb-cplusplus](https://github.com/elbb/bb-cplusplus) where we use the builder and runtime container images to build an example
C++ docker service.

## Using dobi for local build

dobi should only be used via the `dobi.sh` script, because there important variables are set and the right scripts are included.

Predifined resources were provided for these building block and are listed below:

```sh
./dobi.sh build    #build all images
./dobi.sh deploy   #deploy all images
./dobi.sh version  #generate version informations (auto called by dobi.sh)
```

The alias `build` in this building block calls all dobi c++ build jobs. These c++ build jobs use conan to cross compile artifacts. Conan builds necessary dependent artifacts. By default these build jobs use a docker container connected to the `elbb-dev` docker network running the builder image. These build jobs try to upload dependent artifacts to a conan artifactory in this docker network. E.g. you can use the dev environment (<https://github.com/elbb/elbb-dev-environment>) to use a local conan artifactory. This is an optional feature though, the build job will not fail if uploading fails.

If you want to use the optional conan artifactory, you can configure it via the following environment variables:

```sh
NETWORK=yourDockerNetwork CONAN_REMOTE=yourConanArtifactoryURL CONAN_LOGIN_USERNAME=yourUsername CONAN_PASSWORD=yourPassword CONAN_SSL_VERIFICATION=false ./dobi.sh build
```

A more convenient way is to set these environment variables in a `local.env` file. Copy `local.env.template` to `local.env` and adapt `local.env` accordingly.

### Default project variables

Edit `./default.env` to set default project variables.

### Local project variables

If you want to override project variables, copy `./local.env.template` to `./local.env` and edit `./local.env` accordingly.<br>
`./local.env` is ignored by git via `./.gitignore`.

## Using concourse CI for a CI/CD build

The pipeline file must be uploaded to concourse CI via `fly`.
Enter the build users ssh private key into the file `ci/credentials.template.yaml` and rename it to `ci/credentials.yaml`.
Copy the file `ci/email.template.yaml` to `ci/email.yaml` and enter the email server configuration and email addresses.
For further information how to configure the email notification, see: <https://github.com/pivotal-cf/email-resource>

**Note: `credentials.yaml` and `email.yaml` are ignored by `.gitignore` and will not be checked in.**

In further releases there will be a key value store to keep track of the users credentials.
Before setting the pipeline you might login first to your concourse instance `fly -t <target> login --concourse-url http://<concourse>:<port>`. See the [fly documentation](https://concourse-ci.org/fly.html) for more help.
Upload the pipeline file with fly:

    $ fly -t <target> set-pipeline -n -p bb-cplusplus-container-images -l ci/config.yaml -l ci/credentials.yaml -l ci/email.yaml -c ci/pipeline.yaml

After successfully uploading the pipeline to concourse CI login and unpause it. After that the pipeline should be triggered by new commits on the master branch (or new tags if enabled in `ci/pipeline.yaml`).

# What is embedded linux building blocks

embedded linux building blocks is a project to create reusable and
adoptable blueprints for highly recurrent issues in building an internet
connected embedded linux system.

# License

Licensed under either of

-   Apache License, Version 2.0, (./LICENSE-APACHE or <http://www.apache.org/licenses/LICENSE-2.0>)
-   MIT license (./LICENSE-MIT or <http://opensource.org/licenses/MIT>)

at your option.

# Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms or
conditions.

Copyright (c) 2020 conplement AG
