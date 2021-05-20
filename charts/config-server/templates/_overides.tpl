{{/*
All env variables that are accessed from mosip config properties
*/}}
{{- define "config-server.overrides" -}}

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_API_PUBLIC_URL 
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-api-host-url

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_API_INTERNAL_URL 
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-api-internal-url

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_DB_DBUSER_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.db }}
      key: db-dbuser-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_ABIS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_abis_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_ADMIN_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_admin_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_AUTH_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_auth_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_CREREQ_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_crereq_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_CRESER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_creser_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_DATSHA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_datsha_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_IDA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_ida_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_MISP_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_misp_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PARTNER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_partner_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PARTNERMANAGER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_partnermanager_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PMS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_pms_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_POLICYMANAGER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_policymanager_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_PREREG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_prereg_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_REG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_reg_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_REGPROC_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_regproc_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MOSIP_RESIDENT_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_mosip_resident_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_PREREGISTRATION_MOSIP_PREREG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: preregistration_mosip_prereg_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.keycloakHost }}
      key: keycloak-host-url

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_ADMIN_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: admin-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_SOFTHSM_KERNEL_PIN
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.softhsmKernel }}
      key: softhsm-kernel-security-pin

{{- if .Values.installedModules.ida }}
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_SOFTHSM_IDA_PIN
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.softhsmIDA }}
      key: softhsm-ida-security-pin
{{- end }}

{{- if .Values.overrides.configmaps.activemq }}
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ACTIVEMQ_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.activemq }}
      key: activemq-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ACTIVEMQ_CORE_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.activemq }}
      key: activemq-core-port
{{- end }}
    
{{- if .Values.overrides.secrets.activemq }}
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ACTIVEMQ_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.activemq }}
      key: artemis-password
{{- end }}

{{- end }}


