FROM python:3.8

WORKDIR /src/app
COPY src /src/app
RUN chmod 775 /src/app
ENV PYTHONPATH /src/app

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  vim \
  && rm -rf /var/lib/apt/lists/*

# pipのアップデート
RUN pip install --upgrade pip setuptools wheel
# Poetryをインストール
RUN pip install poetry

# コンテナ内で仮想環境の作成を無効
RUN poetry config virtualenvs.create false
RUN poetry config virtualenvs.in-project true

# コンテナ内で仮想環境の作成を無効
RUN poetry install

ENV PATH $PATH:/usr/local/lib/python3.8/site-packages

CMD ["bash"]
