# OpenWorkflow
OpenWorkflow is an open standard for workflow definitions. 
To achieve interoperability it aims to define a programming language agnostic format for workflows and their tasks.

In concept this means that with the help of an SDK a workflow can be parsed into a standardized and serialized format, which then can be executed by schedulers and workflow management engines that support OpenWorkflow.

Additionally, services are defined which define a distributed workflow management engine.

## Version
OpenWorkflow follows [SemVer](https://semver.org/). 
Right now it's in development for a PoC and in version `0.1.0`. 
It's still rapidly changing until the first major release.

## Structure
The standards consists of a [set of definitions](./DEFINITIONS.md), which are supposed improve communication about ideas of workflows, tasks and management of them. 
The formats are defined in [protobuf](https://developers.google.com/protocol-buffers/) and can be found in the [`proto`](./proto/) folder.

## Compiling
You can compile protobuf messages into structure for any supported language. Please refer to the docs. 
The recommended workflow is to create a git submodule for OpenWorkflow, pointing to a version (`git tag`s are tbd!). 
Then you compile the `.proto` file.

### (Python) Example
Make sure have have protoc with Python support installed. 
Then run:
```sh
cd my-awesome-workflows
git submodule add https://github.com/OpenWorkflow/OpenWorkflow.git
protoc -I=./OpenWorkflow/proto/ --python_out=src/ ./OpenWorkflow/proto/openworkflow.proto
```

## Contribute
Right now I'm still working on the first version, so if you want to contribute it's best you open some issues or share this repository (in relation to the proto files). 
If you have anything to add to the textual documentation, feel free to open a PR. Although that is also still under development. 
Once the first release is done, and if there is enough interest by other people, I want to open the development of this to a broader audience and I hope for some acceptance and other picking up on it.
