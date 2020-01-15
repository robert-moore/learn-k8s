docker build -t floomapp/multi-client -f ./client/Dockerfile ./client
docker build -t floomapp/multi-server -f ./server/Dockerfile ./server
docker build -t floomapp/multi-worker -f ./worker/Dockerfile ./worker

docker push floomapp/multi-client
docker push floomapp/multi-server
docker push floomapp/multi-worker

kubectl apply -f k8s

kubectl rollout restart deployment api-deployment
kubectl rollout restart deployment client-deployment
kubectl rollout restart deployment worker-deployment