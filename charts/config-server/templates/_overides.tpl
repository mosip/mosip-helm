{{/*
All env variables that are accessed from mosip config properties
*/}}
{{- define "config-server.overrides" -}}

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIPBOX_PUBLIC_URL: 
  value: {{ printf "https://%s" .Values.mosipApiHost }}   

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_DB_DBUSER_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.db }}
      key: db-dbuser-password

{{- end }}


