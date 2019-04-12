<!-- Auto generated file, please refer to README.yml -->
# Docker marcelocorreia/credstash

---
[![shield](https://img.shields.io/docker/pulls/marcelocorreia/credstash.svg)](https://img.shields.io/docker/pulls/marcelocorreia/credstash.svg)
[![shield](https://img.shields.io/github/languages/top/marcelocorreia/docker-credstash.svg)](https://img.shields.io/github/languages/top/marcelocorreia/docker-credstash.svg)
---
### TLDR;
- [Overview](#overview)
- [Description](#description)
- [Dockerfile](#dockefile)
- [Usage](#usage)
- [License](#license)
### Overview
Docker Ruby Base image





### Usage
### Alias
```bash
$ alias credstash="docker run --rm  -v $(HOME)/.aws:/root/.aws marcelocorreia/credstash"
```
```bash
$ docker run --rm -it  -v /Users/marcelo/.aws:/root/.aws marcelocorreia/credstash \
    -r ap-southeast-2 -p my-profile list
```
## Setting timezone
```bash
$ docker run --rm -it  -v /Users/marcelo/.aws:/root/.aws  \
    -e TZ=Australia/Sydney marcelocorreia/credstash -r ap-southeast-2 -p my-profile list
```
**Targets**
```bash
$ make release
$ make build
$ make push
$ make all-versions
$ make current-version
$ make next-version
```




## Dockerfile 
```Dockerfile
FROM marcelocorreia/base-python

MAINTAINER marcelo correia <marcelo@correia.io>

ARG credstash_version="1.15.0"

RUN apk update
RUN set -ex && \
    apk add --no-cache --update \
        libffi-dev \
        openssl-dev \
        build-base
#        py-pip \
#        python-dev \
#        python \

RUN pip install credstash awscli

ENTRYPOINT ["credstash"]

```

<!-- Apache License -->
### License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

Copyright [2015] 

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
    
<!-- -->






[github]: https://github.com/marcelocorreia

[linkedin]: https://www.linkedin.com/in/marcelocorreia/



[slack]: https://correia-group.slack.com/



