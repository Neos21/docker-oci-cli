# OCI CLI on Docker

OCI CLI を Docker コンテナで動かす。


## Setup

`~/.oci/config` ファイルにて次のように指定する。`key_file` プロパティの値は `~/.oci/` と記述する。

```
[DEFAULT]
tenancy=ocid1.tenancy.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
region=us-ashburn-1
user=ocid1.user.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
fingerprint=xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx
key_file=~/.oci/oci_key.pem
```

次のコマンドで Docker イメージをビルドする。

```sh
$ docker build -t oci-cli .
```


## How To Use

OCI Config を用意し、Docker イメージをビルドすると、次のようにコマンドが使用できる。

```sh
# 「$ oci iam compartment list --all」相当になる
$ docker run -it --rm -v "${HOME}/.oci:/root/.oci" oci-cli:latest iam compartment list --all
```

以下のような Bash Function を定義しておけば通常の `oci` コマンドと同じように実行できる。

```sh
oci() { docker run -it --rm -v "${HOME}/.oci:/root/.oci" oci-cli:latest "$@" ; }
```


## Debug

ash 上で実行するには次のように実行する。

```sh
$ docker run -it --rm -v "${HOME}/.oci:/root/.oci" --entrypoint='/bin/sh' oci-cli:latest
```


## Links

- [Neo's World](https://neos21.net/)
