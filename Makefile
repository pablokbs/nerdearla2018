create:
	export KOPS_FEATURE_FLAGS="SpecOverrideFlag,AlphaAllowDO" && kops create cluster --cloud=digitalocean \
	  --name=k8s.fredrikson.com.ar \
	  --networking=calico \
	  --zones=tor1 \
	  --ssh-public-key=~/.ssh/id_rsa.pub \
	  --node-size=s-2vcpu-2gb \
	  --override=cluster.spec.etcdClusters[*].version=3.1.11 \
	  --node-count=1 \
	  --yes
	kops update cluster k8s.fredrikson.com.ar --yes

delete:
	kops delete cluster k8s.fredrikson.com.ar --yes


demo1:
	kubectl get nodes -o wide
	kubectl get pods -n kube-system -o wide 

demo2:
	kubectl create -f manifests
	sleep 10
	open -a safari "http://178.128.238.172:30002"
	kubectl get pods --all-namespaces -o wide |grep -v kube-system
	ssh -i ~/.ssh/id_rsa core@178.128.238.172 ip route show

demo3:
	kubectl create -n stars -f policies/default-deny.yaml
	kubectl create -n client -f policies/default-deny.yaml

demo4:
	kubectl create -f policies/allow-ui.yaml
	kubectl create -f policies/allow-ui-client.yaml

demo5:
	kubectl create -f policies/backend-policy.yaml

demo6:
	kubectl create -f policies/frontend-policy.yaml

demo7:
	kubectl delete -n stars netpol default-deny
	kubectl delete -n client netpol default-deny
	kubectl -n stars delete netpol allow-ui backend-policy frontend-policy
	kubectl -n client delete netpol allow-ui

demo-clean:
	kubectl delete ns client stars management-ui
