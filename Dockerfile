FROM python:3.8
ENV PORT=5000
COPY . .
RUN pip install -r requirements.txt
ENTRYPOINT python
CMD app.py
