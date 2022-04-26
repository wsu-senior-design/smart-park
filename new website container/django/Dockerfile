# light weight linux operating system with python installed
FROM python:3.11.0a6-alpine3.15
ENV PYTHONBUFFERED 1 
WORKDIR /django
# copy and intall the packages
COPY requirements.txt requirements.txt
RUN pip3 install -r ./requirements.txt
# run commands within the folder
COPY . .

 
