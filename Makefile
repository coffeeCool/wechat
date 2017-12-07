pjName := wechat

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-p 80:7001 \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash