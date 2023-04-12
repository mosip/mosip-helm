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

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ADMIN_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-admin-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PMP_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-pmp-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PREREG_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-prereg-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_RESIDENT_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-resident-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ESIGNET_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-esignet-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_COMPLIANCE_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.global }}
      key: mosip-compliance-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_DB_DBUSER_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.db }}
      key: db-dbuser-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_INTERNAL_URL
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.keycloakHost }}
      key: keycloak-internal-url

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_EXTERNAL_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.keycloakHost }}
      key: keycloak-external-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_INTERNAL_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.keycloakHost }}
      key: keycloak-internal-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_EXTERNAL_URL
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.keycloakHost }}
      key: keycloak-external-url

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ABIS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_abis_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_SYNCDATA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_syncdata_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_CRESER_IDPASS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_creser_idpass_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MPARTNER_DEFAULT_AUTH_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mpartner_default_auth_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_IDREPO_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_idrepo_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MPARTNER_DEFAULT_PRINT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mpartner_default_print_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ADMIN_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_admin_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_AUTH_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_auth_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_CRESER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_creser_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_DATSHA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_datsha_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_IDA_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_ida_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_MISP_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_misp_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PARTNER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_partner_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PARTNERMANAGER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_partnermanager_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PMS_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_pms_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_POLICYMANAGER_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_policymanager_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_REG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_reg_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_REGPROC_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_regproc_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_CREREQ_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_crereq_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_RESIDENT_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_resident_client_secret
    
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PREREG_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_prereg_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_HOTLIST_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mosip_hotlist_client_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_ADMIN_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloak }}
      key: admin-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_SOFTHSM_KERNEL_SECURITY_PIN
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.softhsmKernel }}
      key: security-pin

{{- if .Values.installedModules.ida }}
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_SOFTHSM_IDA_SECURITY_PIN
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.softhsmIDA }}
      key: security-pin
{{- end }}

{{- if .Values.overrides.configmaps.activemq }}
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ACTIVEMQ_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.activemq }}
      key: activemq-host
      {{- end }}

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ACTIVEMQ_CORE_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.activemq }}
      key: activemq-core-port
    
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
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-authtype-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_CREDENTIAL_ISSUE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-credential-issue-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_PARTNER_SERVICE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-partner-service-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_CA_CERTIFICATE_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-ca-certificate-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_HOTLIST_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-hotlist-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_MASTERDATA_TEMPLATES_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-masterdata-templates-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDA_WEBSUB_MASTERDATA_TITLES_CALLBACK_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: ida-websub-masterdata-titles-callback-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_IDREPO_WEBSUB_VID_CREDENTIAL_UPDATE_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: idrepo-websub-vid-credential-update-secret
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_KERNEL_TOKENID_UIN_SALT
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: mosip-kernel-tokenid-uin-salt
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_KERNEL_TOKENID_PARTNERCODE_SALT
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: mosip-kernel-tokenid-partnercode-salt
- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_PRINT_WEBSUB_HUB_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: print-websub-hub-secret
{{- if .Values.installedModules.objectStore }}
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
{{- end }}

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_PRETEXT_VALUE
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.s3 }}
      key: s3-pretext-value

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_EMAIL_SMTP_HOST
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.email }}
      key: email-smtp-host

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_EMAIL_SMTP_USERNAME
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.email }}
      key: email-smtp-username

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_EMAIL_SMTP_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.email }}
      key: email-smtp-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_EMAIL_SMTP_PORT
  valueFrom:
    configMapKeyRef:
      name: {{ .Values.overrides.configmaps.email }}
      key: email-smtp-port

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_PREREG_CAPTCHA_SITE_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.captcha }}
      key: prereg-captcha-site-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_PREREG_CAPTCHA_SECRET_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.captcha }}
      key: prereg-captcha-secret-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ESIGNET_CAPTCHA_SITE_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.captcha }}
      key: esignet-captcha-site-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_ESIGNET_CAPTCHA_SECRET_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.captcha }}
      key: esignet-captcha-secret-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_RESIDENT_CAPTCHA_SITE_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.captcha }}
      key: resident-captcha-site-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_RESIDENT_CAPTCHA_SECRET_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.captcha }}
      key: resident-captcha-secret-key

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MPARTNER_DEFAULT_MOBILE_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mpartner_default_mobile_secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_RESIDENT_WEBSUB_AUTHTYPE_STATUS_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: resident-websub-authtype-status-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_RESIDENT_WEBSUB_AUTH_TRANSACTION_STATUS_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: resident-websub-auth-transaction-status-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_IDA_KYC_TOKEN_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: mosip-ida-kyc-token-secret

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PARTNER_CRYPTO_P12_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.confSecretsVarious }}
      key: mosip-partner-crypto-p12-password

- name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MPARTNER_DEFAULT_DIGITALCARD_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ .Values.overrides.secrets.keycloakClients }}
      key: mpartner_default_digitalcard_secret

{{- end -}}
