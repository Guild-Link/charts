{{- define "hypixel.labels" -}}
app.kubernetes.io/name: hypixel
app.kubernetes.io/part-of: guildlink
app.kubernetes.io/component: {{ .component }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}

{{- define "hypixel.selectorLabels" -}}
app.kubernetes.io/name: hypixel
app.kubernetes.io/component: {{ .component }}
app.kubernetes.io/instance: {{ .root.Release.Name }}
{{- end }}

{{- define "hypixel.extraEnv" -}}
{{- with (index .root.Values.extraEnv .component) }}
{{ toYaml . }}
{{- end }}
{{- end }}

{{- define "hypixel.extraEnvFrom" -}}
{{- with (index .root.Values.extraEnvFrom .component) }}
envFrom:
{{ toYaml . | nindent 2 }}
{{- end }}
{{- end }}

