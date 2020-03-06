build:
	@GOPROXY=https://goproxy.io GOOS=linux GOARCH=amd64 go build -o bin/cas-server server.go
	@cp -r static/ bin/static

prepare:
	@scripts/install_cas.sh

deploy:
	@scripts/deploy.sh

logs:
	ssh server121 "journalctl _SYSTEMD_UNIT=cas.service -xe -n 1000 --no-pager"