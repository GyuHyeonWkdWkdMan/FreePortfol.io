FROM python:3.12.7

WORKDIR /usr/src/app

COPY ./backend ./

RUN pip install --no-cache-dir --upgrade -r ./requirements.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8030"]