FROM python:3.8.0-alpine3.10

# プロキシ使用時は次のようにプロキシを指定する
#ENV http_proxy 【プロキシ URL:ポート】
#ENV https_proxy 【プロキシ URL:ポート】
#ENV HTTP_PROXY 【プロキシ URL:ポート】
#ENV HTTPS_PROXY 【プロキシ URL:ポート】

# プロキシ使用時は pip install コマンドを次のように変更すると良い
#   pip install --no-cache-dir --trusted-host pypi.org --trusted-host files.pythonhosted.org
RUN set -xe && \
    apk add --no-cache --update \
      alpine-sdk \
      libffi \
      libffi-dev \
      openssl \
      openssl-dev && \
    pip install --upgrade pip && \
    pip install --no-cache-dir \
      oci \
      oci-cli

ENTRYPOINT ["/usr/local/bin/oci"]
