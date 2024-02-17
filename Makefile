.PHONY: seed run run_prod run_with_prod

seed:
	dbt seed --profiles-dir profile --project-dir ./data_diff

run:
	dbt run --profiles-dir profile --project-dir ./data_diff
	
run_prod:
	dbt run --profiles-dir profile --project-dir ./data_diff -t prod
	
run_with_diff_stats:
	dbt run \
		--profiles-dir profile \
		--project-dir ./data_diff \
		&& data-diff --dbt \
		--dbt-profiles-dir profile \
		--dbt-project-dir ./data_diff \
		--no-tracking \
		--stats
		
run_with_diff_stats_json:
	dbt run \
		--profiles-dir profile \
		--project-dir ./data_diff \
		&& data-diff --dbt \
		--dbt-profiles-dir profile \
		--dbt-project-dir ./data_diff \
		--no-tracking \
		--stats \
		--json
		
run_with_diff:
	dbt run \
		--profiles-dir profile \
		--project-dir ./data_diff \
		&& data-diff --dbt \
		--dbt-profiles-dir profile \
		--dbt-project-dir ./data_diff \
		--no-tracking