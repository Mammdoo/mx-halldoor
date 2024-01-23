# mx-halldoor

## Who am I
从0开始，部署监控系统。prometheus不仅仅是用来监控k8s，还有很多好玩的东东。本部署基于prometheus operator，把这些好玩的东西带进来。

## Architecture Design

### prometheus
- only calc rules with PrometheusRule， without any scrape 
- receive metrics from PrometheusAgent
- send alert to Alertmanager

### prometheusAgent
- scrape metrics from exporter
- load config from ScrapeConfig with match label
- send metrics to prometheus，must enable remoteWrite

### alertmanager
- receive alerting from prometheus
- load config from alertmanagerConfig

### flow
exporter -> prometheusAgent（scrapeConfig） -> prometheus（prometheusRule） -> alertmanager（alertmanagerConfig）

