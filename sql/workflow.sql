DROP TABLE IF EXISTS workflow;

CREATE TABLE IF NOT EXISTS workflow (
	wid serial PRIMARY KEY,
	openworkflow_message bytea,
	created_at TIMESTAMP DEFAULT NOW()
);
