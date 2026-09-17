{{- define "guildlink.labels" -}}
app.kubernetes.io/name: guildlink
app.kubernetes.io/part-of: guildlink
app.kubernetes.io/component: {{ .component }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}

{{- define "guildlink.selectorLabels" -}}
app.kubernetes.io/name: guildlink
app.kubernetes.io/component: {{ .component }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}

{{- define "guildlink.extraEnv" -}}
{{- with (index .root.Values.extraEnv .component) }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{- define "guildlink.extraEnvFrom" -}}
{{- with (index .root.Values.extraEnvFrom .component) }}
envFrom:
{{ toYaml . | nindent 2 }}
{{- end }}
{{- end }}

