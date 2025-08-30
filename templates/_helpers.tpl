{{/*
Generate a name for the frontend component
*/}}
{{- define "frontend.name" -}}
frontend
{{- end -}}

{{/*
Generate a full name for the frontend deployment (release-name + frontend)
*/}}
{{- define "frontend.fullname" -}}
{{- printf "%s-%s" .Release.Name "frontend" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate a name for the backend component
*/}}
{{- define "backend.name" -}}
backend
{{- end -}}

{{/*
Generate a full name for the backend deployment (release-name + backend)
*/}}
{{- define "backend.fullname" -}}
{{- printf "%s-%s" .Release.Name "backend" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate a name for the mysql component
*/}}
{{- define "mysql.name" -}}
mysql
{{- end -}}

{{/*
Generate a full name for the mysql deployment (release-name + mysql)
*/}}
{{- define "mysql.fullname" -}}
{{- printf "%s-%s" .Release.Name "mysql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
