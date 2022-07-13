all:
  children:
    app:
      hosts:
%{ for ip in app_ip ~}
        app-${replace(ip, ".", "-")}.nip.io:
%{ endfor ~}
    log:
      hosts:
%{ for ip in log_ip ~}
        log-${replace(ip, ".", "-")}.nip.io:
%{ endfor ~}
    prom:
      hosts:
%{ for ip in prom_ip ~}
        prom-${replace(ip, ".", "-")}.nip.io:
%{ endfor ~}
