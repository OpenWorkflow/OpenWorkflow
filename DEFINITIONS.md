# Definitions
Definitions and wording to improve communication and specify ideas and concepts.

## <a name="workflow-management-engine"></a>Workflow Management Engine
A workflow management engine is a piece of software or a combination of multiple softwares which enables the definition of workflows and the execution of such on a specified runtime environment.

## <a name="workflow-bundle"></a>Workflow Bundle
A workflow bundle is a technical collection of workflows. 
It SHALL NOT imply logical grouping, although that MAY be possible, but rather the unit a scheduler is using to separate workflows and their unique attributes. 
Think of it as packages, scopes or namespaces in programming languages.

## <a name="workflow-author"></a>Workflow Author
A workflow author, typically a data engineer, business intelligence technologist or similiar, is the entity responsible for creation the workflow as well as making it available to the scheduler. 
This task can also be automated, if there exists a software which can generate the workflows for certain tasks. Such a software is also considered a workflow author. A (global) configuration which defaults or overwrites certain mutable or immutable attributes is part of the workflow authoring process and therefore considered an automated workflow author.

## <a name="workflow"></a>Workflow
A workflow is a directed acyclic graph (DAG), where each node is a task and each edge is a dependency between those tasks. It is often just called job, DAG, package or many other names. In OpenWorkflow it is called workflow.
One execution of a workflow for a given schedule is called a `workflow instance`. 
The unique name of a workflow is called `workflow id`.
If a scheduler supports versioning, as in tracking changes over time for the same workflow, the definition of a workflow for a specific version is called `workflow version`.

## <a name="task"></a>Task
A task is the basic unit of execution within a workflow and a node inside the directed acyclic graph. 
It is scheduled by the scheduler and executed by the executor. 
The task contains the instructions to execute the workflow and create the desired outcome. 
The unique name of a task is called `task id`.

## <a name="dependencies"></a>Task Dependencies
Task dependencies are how tasks within a workflow relate to each other as they are the edges of the directed acyclic graph. 
One task is executed after another if it is a successor and all dependency criteria are met. 
Each task has a 0-to-N dependency to its succesors. 
A cyclic dependency MUST NOT occur. 
The dependency criteria MUST be one of (`ALL_DONE`, `ONE_DONE`, `ALL_SUCCESS`, `ONE_SUCCESS`, `ALL_FAILED`, `ONE_FAILED`).

## <a name="task-instance"></a>Task Instance
A task instance is a specific execution of a task within a workflow instance. 
If a task has a retry system the instance refers to all retries within this task's execution.

## <a name="exection-instance"></a>Execution Instance
An execution instance is a task instance which is currently being run a by an executor. 
It differs from a task instance as this is the actual run (or try) of the task.

## <a name="scheduler"></a>Scheduler
A scheduler is a piece of software that executes the workflows by deserializing them and interpreting the data structures. 
It runs the workflows upholding their specified dependencies and deploys the tasks into their desired runtime environment by utilizing an executor.
It also checks for task's results and progresses the workflow based on that.

## <a name="executor"></a>Executor
An executor is a piece of software that creates or connects to runtime environments and allows for tasks to be executed on them. 
It also forwards the execution results and outputs to the scheduler.

## <a name="schedule-time"></a>Schedule Time
The schedule time is the time the workflow is supposed to start.

## <a name="execution-time"></a>Execution Time
The execution time is the time a workflow instance is started.

## <a name="parser"></a>Workflow Generator
A workflow generator is a piece of software or a SDK which translates one reprensentation of a workflow, created by the workflow author, into another representation which is readable by the scheduler. 
This can, for example, be a defined domain-specific language (DSL) or a visual editor which directly creates the desired output format. 
> The representation readable by the scheduler, in case of OpenWorkflow, is the defined protobuf formats.

## <a name="broker"></a>Execution Broker
A workflow broker is a piece of software which helps the scheduler find the correct executor for the given runtime environment of a workflow's task.
