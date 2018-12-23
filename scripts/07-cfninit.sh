
curl https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-latest.tar.gz -o /usr/src/aws-cfn-bootstrap-latest.tar.gz

easy_install --script-dir /opt/aws/bin /usr/src/aws-cfn-bootstrap-latest.tar.gz

cat <<END > /lib/systemd/system/cfn-hup.service
[Unit]
Description=cfn-hup daemon
[Service]
Type=simple
ExecStart=/opt/aws/bin/cfn-hup
Restart=always
[Install]
WantedBy=multi-user.target
END

systemctl enable cfn-hup
