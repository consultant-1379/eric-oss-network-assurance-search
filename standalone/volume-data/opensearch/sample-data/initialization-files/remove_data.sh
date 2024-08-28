curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_delete_by_query?routing=1" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{
        "query": {
            "range": {
            "fk_end_timestamp": {
                "lte": "1716396523"
            }
            }
        }
}'
