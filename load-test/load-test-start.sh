docker compose -f docker/docker-compose.yaml up -d influxdb grafana
echo "--------------------------------------------------------------------------------------"
echo "Load testing with Grafana dashboard http://localhost:3030/d/k6/k6-load-testing-results"
echo "--------------------------------------------------------------------------------------"
docker compose -f docker/docker-compose.yaml run --rm k6 run /scripts/load-test.js