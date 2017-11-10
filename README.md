# sdx-decrypt

[![Build Status](https://travis-ci.org/ONSdigital/sdx-decrypt.svg?branch=master)](https://travis-ci.org/ONSdigital/sdx-decrypt) [![Codacy Badge](https://api.codacy.com/project/badge/Grade/9724f552b7e0457d905ebbf54610d06a)](https://www.codacy.com/app/ons-sdc/sdx-decrypt?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=ONSdigital/sdx-decrypt&amp;utm_campaign=Badge_Grade) [![codecov](https://codecov.io/gh/ONSdigital/sdx-decrypt/branch/master/graph/badge.svg)](https://codecov.io/gh/ONSdigital/sdx-decrypt)

sdx-decrypt is a decryption service written in Python. It is a component of the Office of National Statistics (ONS) Survey Data Exchange (SDX) project, which takes an encrypted json payload and transforms it into a number of formats for use within the ONS.

sdx-decrypt uses [JSON Web Tokens](https://jwt.io/) to decrypt data.

## Installation

Using virtualenv and pip, create a new environment and install the requirements:

    $ pip install -r requirements.txt

It's also possible to install within a container using docker. From the sdx-decrypt directory:

    $ docker build -t sdx-decrypt .

## Usage

To start sdx-decrypt, just run the server:

    $ python server.py

## API

 * `POST /decrypt` - decrypts and returns the data it is sent as JSON
 * `GET /healthcheck` - returns a JSON response with a key/value pairs describing the service state


### Example

The example below uses the Python library [requests](https://github.com/kennethreitz/requests) to decrypt some data using sdx-decrypt.

```python
import requests

r = requests.post('http://127.0.0.1:5000/decrypt', data=encrypted_data)

decrypted_data = r.text
```

## Configuration

Compulsory environment variables available for configuration are listed below:

| Environment Variable            | Description
|---------------------------------|-------------------------------
| EQ_PUBLIC_KEY                   | Location of EQ public key
| PRIVATE_KEY                     | Location of private key
| PRIVATE_KEY_PASSWORD            | Private key password

### License

Copyright © 2016, Office for National Statistics (https://www.ons.gov.uk)

Released under MIT license, see [LICENSE](LICENSE) for details.
