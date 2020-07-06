# OpenWorkflow
OpenWorkflow is an open standard for workflow definitions. 
To achieve interoperability it aims to define a programming language agnostic format for workflows and their tasks.

In concept this means that with the help of an SDK a workflow can be parsed into a standardized and serialized format, which then can be executed by schedulers and workflow management engines that support OpenWorkflow.

Additionally, services are defined which define a distributed workflow management engine.

# Motivation
OpenWorkflows has two goals:
1. Define an open standard for the workings of schedulers and workflow management engines such that it becomes easier to communicate our concepts between different fields of data processing and IT.
2. Enhance comparability between engines by knowing to which version or features of OpenWorkflow they adhere.

This can be achieved as this standard will, just like the software itself, evolve over time.

# Version
OpenWorkflow follows [SemVer](https://semver.org/). 
Right now it's in development for a PoC and in version `0.2.0`. 
It's still rapidly changing until the first major release.

# Structure
The standards consists of a [set of definitions](./DEFINITIONS.md), which are supposed improve communication about ideas of workflows, tasks and management of them. 
The formats are defined in [protobuf](https://developers.google.com/protocol-buffers/) and can be found in the [`proto`](./proto/) folder.

# Compiling
You can compile protobuf messages into structure for any supported language. Please refer to the docs. 
The recommended workflow is to create a git submodule for OpenWorkflow, pointing to a version (`git tag`s are tbd!). 
Then you compile the `.proto` file.

## (Python) Example
Make sure have have protoc with Python support installed. 
Then run:
```sh
cd my-awesome-workflows
git submodule add https://github.com/OpenWorkflow/OpenWorkflow.git
protoc -I=./OpenWorkflow/proto/ --python_out=src/ ./OpenWorkflow/proto/openworkflow.proto
```

# Contribute
Right now I'm still working on the first version, so if you want to contribute it's best you open some issues or share this repository. 
Also, if you have anything to add to the textual documentation, feel free to open a PR. Just keep in mind that it is also still under heavy development. 
Once the first release is done, and if there is enough interest by other people, I want to open the development of this to a broader audience and I hope for some acceptance and other picking up on it.

# Reality Check
This is a lot of different pieces of software defined in OpenWorkflow. Do you actually need all of them? 
The short answer is no, you don't. First of all, most workflow management engines today are a all-in-one bundle, meaning most (or all) of the functionality is embedded into one application. This does not mean they can't comply with OpenWorkflow. Secondly, this should just make all the moving parts of a workflow management engine transparent. How they are implemented and coupled or decoupled is up to the software authors. And lastly, you only need what you need. Don't try to solve problems which you _might_ have, but try to solve problems which you have. OpenWorkflow is a standard trying to encompass as many features as possible, while still remaining flexible. This does not mean everybody needs all of those features in their workflow management engine. But then again, there are various open- and closed-source workflow management engines out there, with copious amounts of features, which you might or might not need. This is open very intransparent, it's hardly possible to know all features. Sometimes you don't need certain ones, are missing others or don't know some exist you might want to use. OpenWorkflow aims to help defining features of such systems.
