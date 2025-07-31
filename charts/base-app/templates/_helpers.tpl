{{/*
Return the name of the chart
*/}}
{{- define "base-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name
*/}}
{{- define "base-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name (include "base-app.name" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "base-app.labels" -}}
app.kubernetes.io/name: {{ include "base-app.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
