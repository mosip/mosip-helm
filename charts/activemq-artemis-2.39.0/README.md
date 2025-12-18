* `sessionAffinity` did not work with AWS loadbalancer, so switched off.
* Replication has been forced to 1 and behaviour of multiple masters/slaves needs to be understood well.
* Persitence must be enabled for failover and failback to work properly.  See [issue](https://github.com/vromero/activemq-artemis-helm/issues/22)
* Original chart was modified as below:

```
diff --git a/stable/activemq-artemis/templates/master-configmap.yaml b/stable/activemq-artemis/templates/master-configmap.yaml
index df040d3..54aabbc 100644
--- a/stable/activemq-artemis/templates/master-configmap.yaml
+++ b/stable/activemq-artemis/templates/master-configmap.yaml
@@ -15,7 +15,7 @@ data:
             <master>
               <group-name>to-be-set-by-configure-cluster.sh</group-name>
               <!--we need this for auto failback-->
-              <check-for-live-server>false</check-for-live-server>
+              <check-for-live-server>true</check-for-live-server>
             </master>
           </replication>
         </ha-policy>
diff --git a/stable/activemq-artemis/templates/master-statefulset.yaml b/stable/activemq-artemis/templates/master-statefulset.yaml
index 6fcd8e1..be15a11 100644
--- a/stable/activemq-artemis/templates/master-statefulset.yaml
+++ b/stable/activemq-artemis/templates/master-statefulset.yaml
@@ -27,6 +27,10 @@ spec:
         release: {{ .Release.Name | quote }}
         component: master
     spec:
+      securityContext:
+        fsGroup: 1000
+        runAsUser: 1000
+        runAsNonRoot: true
       affinity:
         podAntiAffinity:
         {{- if eq .Values.antiAffinity "hard" }}
@@ -129,4 +133,4 @@ spec:
   {{- else}}
       - name: data
         emptyDir: {}
-  {{- end}}
\ No newline at end of file
+  {{- end}}
diff --git a/stable/activemq-artemis/templates/service.yaml b/stable/activemq-artemis/templates/service.yaml
index 7c38b52..47b3821 100644
--- a/stable/activemq-artemis/templates/service.yaml
+++ b/stable/activemq-artemis/templates/service.yaml
@@ -7,6 +7,9 @@ metadata:
   annotations:
     # Exclude unready slave nodes from DNS
     service.alpha.kubernetes.io/tolerate-unready-endpoints: "false"
+    service.beta.kubernetes.io/aws-load-balancer-backend-protocol: tcp
+    service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled: 'true'
+    service.beta.kubernetes.io/aws-load-balancer-type: nlb
   name: {{ include "artemis.fullname" . }}
   labels:
 {{ include "artemis.labels.standard" . | indent 4 }}
@@ -25,7 +28,7 @@ spec:
   selector:
     app: {{ template "artemis.name" . }}
     release: {{ .Release.Name | quote }}
-  sessionAffinity: "ClientIP"
+  #sessionAffinity: "ClientIP"
 
 
-{{- end }}
\ No newline at end of file
+{{- end }}
diff --git a/stable/activemq-artemis/templates/slave-configmap.yaml b/stable/activemq-artemis/templates/slave-configmap.yaml
index 7cb8f37..cf70b21 100644
--- a/stable/activemq-artemis/templates/slave-configmap.yaml
+++ b/stable/activemq-artemis/templates/slave-configmap.yaml
@@ -13,6 +13,7 @@ data:
           <replication>
             <slave>
               <group-name>to-be-set-by-configure-cluster.sh</group-name>
+              <allow-failback>true</allow-failback>
             </slave>
           </replication>
         </ha-policy>
@@ -46,4 +47,4 @@ data:
     -N activemq="urn:activemq" \
     -N core="urn:activemq:core" \
     -u "/activemq:configuration/core:core/core:cluster-connections/core:cluster-connection[@name='{{ $releaseName }}']/core:connector-ref" \
-    -v "${HOSTNAME}" /var/lib/artemis/etc-override/broker-10.xml
\ No newline at end of file
+    -v "${HOSTNAME}" /var/lib/artemis/etc-override/broker-10.xml
diff --git a/stable/activemq-artemis/templates/slave-statefulset.yaml b/stable/activemq-artemis/templates/slave-statefulset.yaml
index 7dc81a5..2a80ef8 100644
--- a/stable/activemq-artemis/templates/slave-statefulset.yaml
+++ b/stable/activemq-artemis/templates/slave-statefulset.yaml
@@ -28,6 +28,10 @@ spec:
         release: {{ .Release.Name | quote }}
         component: slave
     spec:
+      securityContext:
+        fsGroup: 1000
+        runAsUser: 1000
+        runAsNonRoot: true
       imagePullSecrets: {{ toYaml .Values.image.pullSecrets }}
       initContainers:
       - name: configure-cluster
diff --git a/stable/activemq-artemis/values.yaml b/stable/activemq-artemis/values.yaml
index a363a8d..71eb5da 100644
--- a/stable/activemq-artemis/values.yaml
+++ b/stable/activemq-artemis/values.yaml
@@ -5,7 +5,7 @@ image:
   # image.repository is the ActiveMQ Artemis image name
   repository: vromero/activemq-artemis
   # image.tag is the ActiveMQ Artemis image's tag: https://hub.docker.com/r/vromero/activemq-artemis/tags
-  # tag: 2.11.0
+  tag: 2.16.0
   # image.pullPolicy is the ActiveMQ Artemis image's pull policy
   pullPolicy: Always
   # image.pullSecrets optionally specify an array of imagePullSecrets.Secrets must be manually created in the namespace.
@@ -17,7 +17,7 @@ artemisUser: artemis
 # artemisPassword sets the artemis admin user password
 artemisPassword: simetraehcapa
 
-replicas: 2
+replicas: 1 
 
 # antiAffinity sets an anti affinity policy between masters and slaves as either hard or soft, default is hard
 antiAffinity: "soft"
@@ -51,13 +51,13 @@ replica:
 ## Persist data to a persitent volume
 persistence:
   testJournalPerformance: AUTO
-  enabled: false
+  enabled: true
   ## If defined, volume.beta.kubernetes.io/storage-class: <storageClass>
   ## Default: volume.alpha.kubernetes.io/storage-class: default
   ##
   # storageClass:
   accessMode: ReadWriteOnce
-  size: 8Gi
+  size: 1Gi
 
 ## Configure resource requests and limits
 ## ref: http://kubernetes.io/docs/user-guide/compute-resources/
```
