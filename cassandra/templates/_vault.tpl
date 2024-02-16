vault.hashicorp.com/agent-inject: 'true'
vault.hashicorp.com/role: 'internal-app'
vault.hashicorp.com/agent-inject-status: 'update' 
vault.hashicorp.com/agent-inject-secret-database-config.txt: 'internal/data/database/config'
vault.hashicorp.com/agent-inject-secret-sms-production-cassandra.txt: 'kv/data/sms/production/cassandra'
vault.hashicorp.com/agent-inject-template-sms-production-cassandra.txt: |
    {{` {{- with secret "kv/data/sms/production/cassandra" -}}
        {{- range $key, $value := .Data.data -}}
            export {{ $key }}='{{ $value }}'
        {{- end -}}
    {{- end -}} `}}  
vault.hashicorp.com/agent-inject-template-database-config.txt: |
    {{` {{- with secret "internal/data/database/config" -}}
        {{- range $key, $value := .Data.data -}}
            export {{ $key }}='{{ $value }}'
        {{- end -}}
    {{- end -}} `}}