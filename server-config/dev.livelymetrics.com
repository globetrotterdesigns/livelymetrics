server {
	listen 80;
	server_name dev.livelymetrics.com;

	location / {
		#uwsgi_pass unix:///webapps/lm.sock;
		uwsgi_pass 127.0.0.1:3031;
		include uwsgi_params;
	}

    location /static/ {
        alias  /webapps/livelymetrics/livelymetrics/static/;
    }
}
