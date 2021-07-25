{{/*
All env variables that are accessed from mosip config properties
*/}}
{{- define "config-server.overrides" -}}

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_API_PUBLIC_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-api-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_API_INTERNAL_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-api-internal-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_DB_DBUSER_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.db }}
      key: db-dbuser-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.keycloakHost }}
      key: keycloak-host-url

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

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_AUTHTYPE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: ida-websub-authtype-callback-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_CREDENTIAL_ISSUE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: ida-websub-credential-issue-callback-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_PARTNER_SERVICE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: ida-websub-partner-service-callback-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_CA_CERTIFICATE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: ida-websub-ca-certificate-callback-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_HOTLIST_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: ida-websub-hotlist-callback-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_KERNEL_TOKENID_UIN_SALT
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: mosip-kernel-tokenid-uin-salt

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_KERNEL_TOKENID_PARTNERCODE_SALT
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: mosip-kernel-tokenid-partnercode-salt

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_PRINT_WEBSUB_HUB_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ printf "%s-various" (include "config-server.fullname" .) }}
      key: print-websub-hub-secret

{{- if eq .Values.installedModules.objectStore "s3" }}
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_ACCESSKEY
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.s3 }}
      key: s3-user-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_REGION
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.s3 }}
      key: s3-region

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_SECRETKEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.s3 }}
      key: s3-user-secret

{{- else if eq .Values.installedModules.objectStore "minio" }}
{{- end }}

{{- end }}

