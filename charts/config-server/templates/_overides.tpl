{{/*
All env variables that are accessed from mosip config properties
*/}}
{{- define "config-server.overrides" -}}

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIPBOX_PUBLIC_URL 
  value: {{ printf "https://%s" .Values.mosipApiHost }}   

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_DB_DBUSER_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.db }}
      key: db-dbuser-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_ABIS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-abis-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_ADMIN_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-admin-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_AUTH_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-auth-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_CREREQ_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-crereq-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_CRESER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-creser-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_DATSHA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-datsha-client-secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_IDA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-ida-client-secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_MISP_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-misp-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PARTNER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-partner-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PARTNERMANAGER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-partnermanager-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PMS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-pms-client-secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_POLICYMANAGER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-policymanager-client-secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PREREG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-prereg-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_REG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-reg-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_REGPROC_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-regproc-client-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_RESIDENT_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: mosip-mosip-resident-client-secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_PREREGISTRATION_MOSIP_PREREG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: preregistration-mosip-prereg-client-secret
    
{{- end }}


