DROP TABLE IF EXISTS workflow;

CREATE TABLE IF NOT EXISTS workflow (
	wid SERIAL PRIMARY KEY,
	workflow_id TEXT,
	openworkflow_message BYTEA,
	created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS ix_workflow_workflow_id ON workflow(workflow_id);
