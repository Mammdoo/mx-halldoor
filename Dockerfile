FROM mammdoo/k8s-toolkit:0.1.1

COPY . /app/
WORKDIR /app

CMD ["ansible-playbook", "-i", "inventory/local", "prometheus.yml", "--tags=prometheus", "--extra=@demo.json"]