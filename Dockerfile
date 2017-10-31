FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential wget
RUN wget -c https://s3-us-west-1.amazonaws.com/fasttext-vectors/wiki.es.vec
ADD requirements.txt /
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ADD word2vec-api.py /
ENTRYPOINT ["python"]
CMD ["word2vec-api.py", "--model", "wiki.es.vec"]