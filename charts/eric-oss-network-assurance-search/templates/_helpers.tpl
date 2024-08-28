{{/*
Create a map from ".Values.global" with defaults if missing in values file.
This hides defaults from values file.
*/}}
{{- define "eric-oss-network-assurance-search.global" -}}
  {{- $globalDefaults := dict "security" (dict "tls" (dict "enabled" false)) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "security" (dict "policyBinding" (dict "create" false))) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "registry" (dict "url" "armdocker.rnd.ericsson.se")) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "registry" (dict "imagePullPolicy" "IfNotPresent")) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "persistenceEngine" "os") -}}
  {{- $globalDefaults := merge $globalDefaults (dict "discovery" "ais") -}}
  {{- $globalDefaults := merge $globalDefaults (dict "tolerations" (list)) -}}
  {{- if .Values.global -}}
    {{- mergeOverwrite $globalDefaults .Values.global | toJson -}}
  {{- else -}}
    {{- $globalDefaults | toJson -}}
  {{- end -}}
{{- end -}}

{{/*
    Define Image Pull Policy
*/}}
{{- define "eric-oss-network-assurance-search.registryImagePullPolicy" -}}
    {{- $globalRegistryPullPolicy := "IfNotPresent" -}}
    {{- if .Values.global -}}
        {{- if .Values.global.registry -}}
            {{- if .Values.global.registry.imagePullPolicy -}}
                {{- $globalRegistryPullPolicy = .Values.global.registry.imagePullPolicy -}}
            {{- end -}}
        {{- end -}}
    {{- end -}}
    {{- print $globalRegistryPullPolicy -}}
{{- end -}}

{{/*
Defaults labels with Log Streaming Method Label
*/}}
{{- define "eric-oss-network-assurance-search.labels-and-logStream" -}}
  {{- $labels := include "eric-oss-network-assurance-search.labels" . | fromYaml -}}
  {{- $logStream := include "eric-oss-network-assurance-search.directStreamingLabel" . | fromYaml -}}
  {{- $sidecarInject := include "eric-oss-network-assurance-search.sidecarInjectLabel" . | fromYaml -}}
  {{- include "eric-oss-network-assurance-search.mergeLabels" (dict "location" .Template.Name "sources" (list $labels $logStream $sidecarInject)) }}
{{- end -}}

{{/*
Defaults common, apparmor, seccomp annotations
*/}}
{{- define "eric-oss-network-assurance-search.mergedAnnotations" -}}
  {{- $common := include "eric-oss-network-assurance-search.commonAnnotations" . | fromYaml -}}
  {{- $appArmor := include "eric-oss-network-assurance-search.apparmorAnnotations" . | fromYaml -}}
  {{- $seccomp := include "eric-oss-network-assurance-search.seccompAnnotations" . | fromYaml -}}
  {{- include "eric-oss-network-assurance-search.mergeAnnotations" (dict "location" .Template.Name "sources" (list $common $appArmor $seccomp)) }}
{{- end -}}

{{/*
Defaults service ports and protocol
*/}}
{{- define "eric-oss-network-assurance-search.port-and-protocol" -}}
 {{- if  (eq (include "eric-oss-network-assurance-search.global-security-tls-enabled" .) "true") }}
  ui.ericsson.com/protocol: https
  {{- else }}
      ui.ericsson.com/protocol: http
      {{- end }}
      ui.ericsson.com/port: {{ include "eric-oss-network-assurance-search.service-port" . | quote }}
{{- end -}}

{{/*
Defaults prometheus
*/}}
{{- define "eric-oss-network-assurance-search.prometheus" -}}
  {{- if .Values.metrics.enabled }}
    prometheus.io/scrape: 'true'
    prometheus.io/port: {{ include "eric-oss-network-assurance-search.service-port" . | quote }}
  {{- end }}
{{- end -}}

{{/*
Defaults service annotations
*/}}
{{- define "eric-oss-network-assurance-search.service-annotations" -}}
  {{- $common := include "eric-oss-network-assurance-search.commonAnnotations" . | fromYaml -}}
  {{- $portnprotocol := include "eric-oss-network-assurance-search.port-and-protocol" . | fromYaml -}}
  {{- $prom := include "eric-oss-network-assurance-search.prometheus" . | fromYaml -}}
  {{- include "eric-oss-network-assurance-search.mergeAnnotations" (dict "location" .Template.Name "sources" (list $common $portnprotocol $prom)) }}
{{- end -}}

{{/*
Register Hooks Condition
*/}}
{{- define "eric-oss-network-assurance-search.register" -}}
  {{- $condition := false }}
  {{- if .Values.apiGatewayRoute.enabled }}
    {{- if .Values.global }}
      {{- if .Values.global.hosts }}
        {{- if and .Values.global.hosts.iam .Values.global.hosts.gas }}
          {{- $condition = true }}
        {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
  {{- print $condition }}
{{- end -}}

{{/*
Expand the name of the chart.
*/}}
{{- define "eric-oss-network-assurance-search.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart version as used by the chart label.
*/}}
{{- define "eric-oss-network-assurance-search.version" -}}
{{- printf "%s" .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "eric-oss-network-assurance-search.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create any image path from eric-product-info.yaml (DR-D1121-067)
*/}}
{{- define "eric-oss-network-assurance-search.imagePath" }}
    {{- $imageId := index . "imageId" -}}
    {{- $values := index . "values" -}}
    {{- $files := index . "files" -}}
    {{- $productInfo := fromYaml ($files.Get "eric-product-info.yaml") -}}
    {{- $registryUrl := index $productInfo "images" $imageId "registry" -}}
    {{- $repoPath := index $productInfo "images" $imageId "repoPath" -}}
    {{- $name := index $productInfo "images" $imageId "name" -}}
    {{- $tag :=  index $productInfo "images" $imageId "tag" -}}
    {{- if $values.global -}}
        {{- if $values.global.registry -}}
            {{- $registryUrl = default $registryUrl $values.global.registry.url -}}
            {{- $repoPath = default $repoPath $values.global.registry.repoPath -}}
        {{- end -}}
    {{- end -}}
    {{- if $values.imageCredentials -}}
        {{- if $values.imageCredentials.registry -}}
            {{- $registryUrl = default $registryUrl $values.imageCredentials.registry.url -}}
        {{- end -}}
        {{- if not (kindIs "invalid" $values.imageCredentials.assurancesearch.repoPath) -}}
            {{- $repoPath = $values.imageCredentials.assurancesearch.repoPath -}}
        {{- end -}}
        {{- $image := index $values.imageCredentials $imageId -}}
        {{- if $image -}}
            {{- if $image.registry -}}
                {{- $registryUrl = default $registryUrl $image.registry.url -}}
            {{- end -}}
            {{- if not (kindIs "invalid" $image.repoPath) -}}
                {{- $repoPath = $image.repoPath -}}
            {{- end -}}
        {{- end -}}
    {{- end -}}
    {{- if $repoPath -}}
        {{- $repoPath = printf "%s/" $repoPath -}}
    {{- end -}}
    {{- printf "%s/%s%s:%s" $registryUrl $repoPath $name $tag -}}
{{- end -}}

{{/*
Create image pull secrets.
*/}}
{{- define "eric-oss-network-assurance-search.pullSecrets" -}}
{{- $global := fromJson (include "eric-oss-network-assurance-search.global" .) -}}
{{- if .Values.imageCredentials.pullSecret -}}
    {{- print .Values.imageCredentials.pullSecret -}}
{{- else if $global.pullSecret -}}
    {{- print $global.pullSecret -}}
{{- end -}}
{{- end -}}

{{/*
Create Ericsson product specific annotations.
*/}}
{{- define "eric-oss-network-assurance-search.product-info" }}
ericsson.com/product-name: {{ (fromYaml (.Files.Get "eric-product-info.yaml")).productName | quote }}
ericsson.com/product-number: {{ (fromYaml (.Files.Get "eric-product-info.yaml")).productNumber | quote }}
ericsson.com/product-revision: {{regexReplaceAll "(.*)[+].*" .Chart.Version "${1}" }}
{{- end -}}

{{/*
Common annotations
*/}}
{{- define "eric-oss-network-assurance-search.commonAnnotations" -}}
  {{- $productInfoAnn := include "eric-oss-network-assurance-search.product-info" . | fromYaml -}}
  {{- $globalAnn := (.Values.global).annotations -}}
  {{- $serviceAnn := .Values.annotations -}}
  {{- include "eric-oss-network-assurance-search.mergeAnnotations" (dict "location" .Template.Name "sources" (list $productInfoAnn $globalAnn $serviceAnn)) | trim }}
{{- end -}}

{{/*
Create Ericsson product app.kubernetes.io info
*/}}
{{- define "eric-oss-network-assurance-search.kubernetes-io-info" -}}
app.kubernetes.io/name: {{ .Chart.Name | quote }}
app.kubernetes.io/version: {{ .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}


{{/*
Define the apparmor annotation creation based on input argument
*/}}
{{- define "eric-oss-network-assurance-search.apparmorAnnotation.getAnnotation" -}}
{{- $profile := index . "profile" -}}
{{- $podName := index . "podName" -}}
{{- if $profile.type -}}
{{- if eq "runtime/default" (lower $profile.type) }}
container.apparmor.security.beta.kubernetes.io/{{ $podName }}: "runtime/default"
{{- else if eq "unconfined" (lower $profile.type) }}
container.apparmor.security.beta.kubernetes.io/{{ $podName }}: "unconfined"
{{- else if eq "localhost" (lower $profile.type) }}
{{- if $profile.localhostProfile }}
{{- $localhostProfileList := (split "/" $profile.localhostProfile) -}}
{{- if $localhostProfileList._1 }}
container.apparmor.security.beta.kubernetes.io/{{ $podName }}: "localhost/{{ $localhostProfileList._1 }}"
{{- end }}
{{- end }}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Define the apparmor annotation for the assurancesearch container
*/}}
{{- define "eric-oss-network-assurance-search.apparmorAnnotation.assurancesearch" -}}
{{- if .Values.apparmorProfile -}}
{{- $profile := .Values.apparmorProfile }}
{{- if .Values.apparmorProfile.assurancesearch -}}
{{- $profile = .Values.apparmorProfile.assurancesearch }}
{{- end -}}
{{- include "eric-oss-network-assurance-search.apparmorAnnotation.getAnnotation" (dict "profile" $profile "podName" "assurancesearch") }}
{{- end -}}
{{- end -}}

{{/*
Define the apparmor annotations
*/}}
{{- define "eric-oss-network-assurance-search.apparmorAnnotations" -}}
{{- include "eric-oss-network-assurance-search.apparmorAnnotation.assurancesearch" .}}
{{- end -}}


{{/*
 Define the seccomp securityContext for the container
*/}}
{{- define "eric-oss-network-assurance-search.seccompProfile" -}}
{{- if .Values.seccompProfile }}
{{- $profile := .Values.seccompProfile }}
{{- if .Values.seccompProfile.assurancesearch }}
{{- $profile = .Values.seccompProfile.assurancesearch }}
{{- end }}
{{- if $profile.type }}
{{- if eq "runtimedefault" (lower $profile.type) }}
 seccompProfile:
  type: RuntimeDefault
 {{- else if eq "unconfined" (lower $profile.type) }}
 seccompProfile:
   type: Unconfined
 {{- else if eq "localhost" (lower $profile.type) }}
 seccompProfile:
   type: Localhost
   localhostProfile: {{ $profile.localhostProfile }}
 {{- end }}
{{- end }}
 {{- end }}
{{- end -}}

{{/*
  Defines seccomp annotations for pod spec.
  Kubernetes resources Item for PodSpec
  Required Scope: default chart context
*/}}
{{- define "eric-oss-network-assurance-search.seccompAnnotations" -}}
{{- if not ((.Values).seccompProfile).type }}
{{- printf "seccomp.security.alpha.kubernetes.io/pod: runtime/default" -}}
{{- end -}}
{{- end -}}
{{/*
Helm and Kubernetes labels
*/}}
{{- define "eric-oss-network-assurance-search.helmK8s-labels" }}
app.kubernetes.io/name: {{ include "eric-oss-network-assurance-search.name" . }}
helm.sh/chart: {{ include "eric-oss-network-assurance-search.chart" . }}
app.kubernetes.io/version: {{ include "eric-oss-network-assurance-search.version" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "eric-oss-network-assurance-search.labels" -}}
  {{- $helmK8sLabels := include "eric-oss-network-assurance-search.helmK8s-labels" . | fromYaml -}}
  {{- $globalLabels := (.Values.global).labels -}}
  {{- $serviceLabels := .Values.labels -}}
  {{- include "eric-oss-network-assurance-search.mergeLabels" (dict "location" .Template.Name "sources" (list $helmK8sLabels $globalLabels $serviceLabels)) | trim }}
{{- end -}}

{{/*
Merge global tolerations with service tolerations (DR-D1120-061).
*/}}
{{- define "eric-oss-network-assurance-search.merge-tolerations" -}}
  {{- $serviceTolerations := index .Values "tolerations" -}}
  {{- if index .Values "global" -}}
    {{- if index .Values "global" "tolerations" -}}
      {{- $globalTolerations := index .Values "global" "tolerations" -}}
      {{- $result := list -}}
      {{- $nonMatchingItems := list -}}
      {{- range $gItem := $globalTolerations -}}
        {{- $gItemId := include "eric-oss-network-assurance-search.tolerations.get-identifier" $gItem -}}
        {{- $matchingItems := list -}}
        {{- range $sItem := $serviceTolerations -}}
          {{- $sItemId := include "eric-oss-network-assurance-search.tolerations.get-identifier" $sItem -}}
          {{- if eq $sItemId $gItemId -}}
            {{- $matchingItems = append $matchingItems $sItem -}}
          {{- else -}}
            {{- $nonMatchingItems = append $nonMatchingItems $sItem -}}
          {{- end -}}
        {{- end -}}
        {{- if eq (len $matchingItems) 0 -}}
          {{- /*
          No corresponding service level tolerations array element found.
          The global level tolerations array element can be added as is.
          */ -}}
          {{- $result = append $result $gItem -}}
        {{- else if eq (len $matchingItems) 1 -}}
          {{- /*
          A corresponding service level tolerations array element is found.
          This service level tolerations array element will be
          added instead of the global level tolerations array element.
          */ -}}
          {{- $result = append $result (index $matchingItems 0) -}}
        {{- else -}}
          {{- /*
          More than 1 corresponding service level tolerations array
          elements are found. We must panic because it is possible there is
          a misconfiguration in the tolerations.
          */ -}}
          {{- printf "Failed to merge tolerations. More than 1 corresponding service level tolerations found." | fail -}}
        {{- end -}}
      {{- end -}}
      {{- toYaml (concat $result $nonMatchingItems | uniq) -}}
    {{- else -}}
      {{- toYaml $serviceTolerations -}}
    {{- end -}}
  {{- else -}}
    {{- toYaml $serviceTolerations -}}
  {{- end -}}
{{- end -}}

{{/*
Helper function to get the identifier of a tolerations array element.
Assumes all keys except tolerationSeconds are used to uniquely identify
a tolerations array element.
*/}}
{{ define "eric-oss-network-assurance-search.tolerations.get-identifier" }}
  {{- $keyValues := list -}}
  {{- range $key := (keys . | sortAlpha) -}}
    {{- if ne $key "tolerationSeconds" -}}
      {{- $keyValues = append $keyValues (printf "%s=%s" $key (index $ $key)) -}}
    {{- end -}}
  {{- end -}}
  {{- printf "%s" (join "," $keyValues) -}}
{{ end }}

{{/*
Create a merged set of nodeSelectors from global and service level.
*/}}
{{- define "eric-oss-network-assurance-search.nodeSelector" -}}
{{- $globalValue := (dict) -}}
{{- if .Values.global -}}
    {{- if .Values.global.nodeSelector -}}
      {{- $globalValue = .Values.global.nodeSelector -}}
    {{- end -}}
{{- end -}}
{{- if .Values.nodeSelector -}}
  {{- range $key, $localValue := .Values.nodeSelector -}}
    {{- if hasKey $globalValue $key -}}
         {{- $Value := index $globalValue $key -}}
         {{- if ne $Value $localValue -}}
           {{- printf "nodeSelector \"%s\" is specified in both global (%s: %s) and service level (%s: %s) with differing values which is not allowed." $key $key $globalValue $key $localValue | fail -}}
         {{- end -}}
     {{- end -}}
    {{- end -}}
    nodeSelector: {{- toYaml (merge $globalValue .Values.nodeSelector) | trim | nindent 2 -}}
{{- else -}}
  {{- if not ( empty $globalValue ) -}}
    nodeSelector: {{- toYaml $globalValue | trim | nindent 2 -}}
  {{- end -}}
{{- end -}}
{{- end -}}

{{/*
Release name.
*/}}
{{- define "eric-oss-network-assurance-search.release.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Timezone variable
*/}}
{{- define "eric-oss-network-assurance-search.timezone" }}
  {{- $timezone := "UTC" }}
  {{- if .Values.global }}
    {{- if .Values.global.timezone }}
      {{- $timezone = .Values.global.timezone }}
    {{- end }}
  {{- end }}
  {{- print $timezone | quote }}
{{- end -}}

{{/*
DR-D1123-124
*/}}
{{- define "eric-oss-network-assurance-search.securityPolicy.reference" -}}
  {{- if .Values.global -}}
    {{- if .Values.global.security -}}
      {{- if .Values.global.security.policyReferenceMap -}}
        {{ $mapped := index .Values "global" "security" "policyReferenceMap" "default-restricted-security-policy" }}
        {{- if $mapped -}}
          {{ $mapped }}
        {{- else -}}
          {{- default "default-restricted-security-policy" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
        {{- end -}}
      {{- else -}}
        {{- default "default-restricted-security-policy" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
      {{- end -}}
    {{- else -}}
      {{- default "default-restricted-security-policy" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
    {{- end -}}
  {{- else -}}
    {{- default "default-restricted-security-policy" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- end -}}

{{/*
DR-D1123-124
*/}}
{{- define "eric-oss-network-assurance-search.securityPolicy.annotations" }}
ericsson.com/security-policy.name: "restricted/default"
ericsson.com/security-policy.privileged: "false"
ericsson.com/security-policy.capabilities: "N/A"
{{- end -}}

{{/*
The name of the cluster role used during openshift deployments.
This helper is provided to allow use of the new global.security.privilegedPolicyClusterRoleName if set, otherwise
use the previous naming convention of <release_name>-allowed-use-privileged-policy for backwards compatibility.
*/}}
{{- define "eric-oss-network-assurance-search.privileged.cluster.role.name" -}}
  {{- if hasKey (.Values.global) "security" -}}
    {{- if hasKey (.Values.global.security) "privilegedPolicyClusterRoleName" -}}
        {{ .Values.global.security.privilegedPolicyClusterRoleName }}
    {{- else -}}
        {{ template "eric-oss-network-assurance-search.release.name" . }}-allowed-use-privileged-policy
    {{- end -}}
  {{- else -}}
      {{ template "eric-oss-network-assurance-search.release.name" . }}-allowed-use-privileged-policy
  {{- end -}}
{{- end -}}

{{- /*
Generic function for merging annotations and labels (version: 1.0.1)
{
    context: string
    sources: [[sourceData: {key => value}]]
}
*/ -}}
{{- define "eric-oss-network-assurance-search.aggregatedMerge" -}}
  {{- $merged := dict -}}
  {{- $context := .context -}}
  {{- $location := .location -}}
  {{- range $sourceData := .sources -}}
    {{- range $key, $value := $sourceData -}}
      {{- /* FAIL: when the input is not string. */ -}}
      {{- if not (kindIs "string" $value) -}}
        {{- $problem := printf "Failed to merge keys for \"%s\" in \"%s\": invalid type" $context $location -}}
        {{- $details := printf "in \"%s\": \"%s\"." $key $value -}}
        {{- $reason := printf "The merge function only accepts strings as input." -}}
        {{- $solution := "To proceed, please pass the value as a string and try again." -}}
        {{- printf "%s %s %s %s" $problem $details $reason $solution | fail -}}
      {{- end -}}
      {{- if hasKey $merged $key -}}
        {{- $mergedValue := index $merged $key -}}
        {{- /* FAIL: when there are different values for a key. */ -}}
        {{- if ne $mergedValue $value -}}
          {{- $problem := printf "Failed to merge keys for \"%s\" in \"%s\": key duplication in" $context $location -}}
          {{- $details := printf "\"%s\": (\"%s\", \"%s\")." $key $mergedValue $value -}}
          {{- $reason := printf "The same key cannot have different values." -}}
          {{- $solution := "To proceed, please resolve the conflict and try again." -}}
          {{- printf "%s %s %s %s" $problem $details $reason $solution | fail -}}
        {{- end -}}
      {{- end -}}
      {{- $_ := set $merged $key $value -}}
    {{- end -}}
  {{- end -}}
{{- /*
Strings used as parameter value shall always be quoted. (DR-D1121-160)
The below is a workaround to toYaml, which removes the quotes.
Instead we loop over and quote each value.
*/ -}}
{{- range $key, $value := $merged }}
{{ $key }}: {{ $value | quote }}
{{- end -}}
{{- end -}}
{{- /*
Wrapper functions to set the contexts
*/ -}}
{{- define "eric-oss-network-assurance-search.mergeAnnotations" -}}
  {{- include "eric-oss-network-assurance-search.aggregatedMerge" (dict "context" "annotations" "location" .location "sources" .sources) }}
{{- end -}}
{{- define "eric-oss-network-assurance-search.mergeLabels" -}}
  {{- include "eric-oss-network-assurance-search.aggregatedMerge" (dict "context" "labels" "location" .location "sources" .sources) }}
{{- end -}}

{{/*
    Define Global Security enabled
*/}}
{{- define "eric-oss-network-assurance-search.global-security-tls-enabled" -}}
    {{- if  .Values.global -}}
      {{- if  .Values.global.security -}}
        {{- if  .Values.global.security.tls -}}
           {{- .Values.global.security.tls.enabled | toString -}}
        {{- else -}}
           {{- "false" -}}
        {{- end -}}
      {{- else -}}
           {{- "false" -}}
      {{- end -}}
    {{- else -}}
        {{- "false" -}}
    {{- end -}}
{{- end -}}

{{/*
    Define log Security enabled
*/}}
{{- define "eric-oss-network-assurance-search.log-tls-enabled" -}}
  {{- $logtls := include "eric-oss-network-assurance-search.global-security-tls-enabled" . | trim -}}

  {{- if  .Values.log -}}
    {{- if  .Values.log.tls -}}
      {{- $logtls = .Values.log.tls.enabled | toString -}}
    {{- end -}}
  {{- end -}}
  {{- print $logtls -}}
{{- end -}}

{{/*
    Define Service Port based on TLS
*/}}
{{- define "eric-oss-network-assurance-search.service-port" -}}
  {{- if  (eq (include "eric-oss-network-assurance-search.global-security-tls-enabled" .) "true") }}
    {{- .Values.service.port.https -}}
  {{- else -}}
    {{- .Values.service.port.http -}}
  {{- end -}}
{{- end -}}

{{/*
    Define NAS Security enabled
*/}}
{{- define "eric-oss-network-assurance-search.nas-security-tls-enabled" -}}
  {{- $tls := include "eric-oss-network-assurance-search.global-security-tls-enabled" . | trim -}}

  {{- if  .Values.security -}}
    {{- if  .Values.security.tls -}}
      {{- $tls = .Values.security.tls.enabled | toString -}}
    {{- end -}}
  {{- end -}}
  {{- print $tls -}}
{{- end -}}

{{/*----------------------------------- ADP Logging----------------------------------*/}}

{{/*
Define the log streaming method (DR-470222-010)
*/}}
{{- define "eric-oss-network-assurance-search.log-streamingMethod" -}}
{{- $streamingMethod := "direct" -}}
{{- if .Values.global -}}
  {{- if .Values.global.log -}}
      {{- if .Values.global.log.streamingMethod -}}
        {{- $streamingMethod = .Values.global.log.streamingMethod }}
      {{- end -}}
  {{- end -}}
{{- end -}}
{{- if .Values.log -}}
  {{- if .Values.log.streamingMethod -}}
    {{- $streamingMethod = .Values.log.streamingMethod }}
  {{- end -}}
{{- end -}}
{{- print $streamingMethod -}}
{{- end -}}

{{/*
Define the label needed for reaching eric-log-transformer (DR-470222-010)
*/}}
{{- define "eric-oss-network-assurance-search.directStreamingLabel" -}}
{{- $streamingMethod := (include "eric-oss-network-assurance-search.log-streamingMethod" .) -}}
{{- if or (eq "direct" $streamingMethod) (eq "dual" $streamingMethod) }}
logger-communication-type: "direct"
{{- end -}}
{{- end -}}

{{- define "eric-oss-network-assurance-search.log-syslog-enabled" -}}
  {{- $streamingMethod := (include "eric-oss-network-assurance-search.log-streamingMethod" .) -}}
  {{- if or (eq $streamingMethod "dual") (eq $streamingMethod "direct") -}}
    {{- printf "%t" true -}}
  {{- else -}}
    {{- printf "%t" false -}}
  {{- end -}}
{{- end -}}

{{- define "eric-oss-network-assurance-search.log-stdout-enabled" -}}
  {{- $streamingMethod := (include "eric-oss-network-assurance-search.log-streamingMethod" .) -}}
  {{- if or (eq $streamingMethod "dual") (eq $streamingMethod "indirect") -}}
    {{- printf "%t" true -}}
  {{- else -}}
    {{- printf "%t" false -}}
  {{- end -}}
{{- end -}}

{{/*
DR-D1120-056 - Define Pod Disruption Budget value taking into account its type (int or string)
*/}}
{{- define "eric-oss-network-assurance-search.pod-disruption-budget" -}}
  {{- if kindIs "string" .Values.podDisruptionBudget.minAvailable -}}
    {{- print .Values.podDisruptionBudget.minAvailable | quote -}}
  {{- else -}}
    {{- print .Values.podDisruptionBudget.minAvailable | atoi -}}
  {{- end -}}
{{- end -}}

{{/*
Define the label needed for avoiding interception of pod creation by service mesh admission webhook (DR-D470217-001)
*/}}
{{- define "eric-oss-network-assurance-search.sidecarInjectLabel" -}}
  sidecar.istio.io/inject: "false"
{{- end -}}
