> [!NOTE]
>
> This repository is forked from the [original](https://github.com/VaughnVernon/IDDD_Samples)
> with Java 8, which a relatively modern version in 2024,
> and docker compose task definition to allow for hands-on.
> 
> Now you can interact with the code. Actually make assertions,
> step-by-step execution with IDEs to understand how it works.
> 
> Because the original code was written over a decade ago,
> so most of the code can be drastically refactored but I intentionally
> leave it as your opportunity.

These are the sample Bounded Contexts from the book
"Implementing Domain-Driven Design" by Vaughn Vernon:

http://vaughnvernon.co/?page_id=168

The models and surrounding architectural mechanisms
may be in various states of flux as the are refined
over time. Some tests may be incomplete. The code is
not meant to be a reflection of a production quality
work, but rather as a set of reference projects for
the book.

Points of Interest
==================

The iddd_agilepm project uses a key-value store as
its underlying persistence mechanism, and in particular
is LevelDB. Actually the LevelDB in use is a pure Java
implementation: https://github.com/dain/leveldb

Currently iddd_agilepm doesn't employ a container of
any kind (such as Spring).

The iddd_collaboration project uses Event Sourcing and
CQRS. It purposely avoids the use of an object-relational
mapper, showing that a simple JDBC-based query engine
and DTO matter can be used instead. This technique does
have its limitations, but it is meant to be small and fast
and require no configuration or annotations. It is not
meant to be perfect.

It may be helpful to make one additional mental note on
the iddd_collaboration CQRS implementation. To keep the
example simple it persists the Event Sourced write model
and the CQRS read model in one thread. Since two different
stores are used--LevelDB for the Event Journal and MySQL
for the read model--there may be very slight opportunities
for inconsistency, but not much. The idea was to keep the
two models as close to consistent as possible without
using the same data storage (and transaction) for both.
Two different storage mechanisms were used purposely to
demonstrate that they can be separate.

The iddd_identityaccess project uses object-relational
mapping (Hibernate), but so as not to leave it "boring" it
provides a RESTful client interface and even publishes
Domain-Event notifications via REST (logs) and RabbitMQ.

Finally the iddd_common project provides a number of reusable
components. This is not an attempt to be a framework, but
just leverages reuse to the degree that code copying doesn't
liter each project. This is not a recommendation, but it
did work well and save a considerable amount of work while
producing the samples.

Usage
=====

Requires
--------

- Java 8
- MySQL Client + Server
- RabbitMQ

Setup JDK
---------

Download and install Java 8 from arbitrary provider.

> [!NOTE]
>
> You can also get a support of IDEs thanks to relatively modern Java version compared with the original repository.
>
> See [IDEA official doc](https://www.jetbrains.com/help/idea/sdk.html#supported-sdks) to change project Java SDK.

Make sure `1.8.*` is available on your machine.

```shell
# for macOS example
/usr/libexec/java_home -V
```

Set `JAVA_HOME` environment variable to use the old version Java on the current shell.

```shell
export JAVA_HOME=`/usr/libexec/java_home -v <OLD_JAVA_VERSION>`
```

Make sure the Java version has been changed.

```shell
java -version
```

Setup (with Docker)
-------------------

To make it easy to run the tests and it requirements,
run `docker compose up` and execute `setup_db.sh`
to create required databases to the MySQL Server.

`docker compose up` will start a:

- MySQL Server container
- RabbitMQ Server container
- RabbitMQ Management container

If you use the `docker compose up` command, you don't need
MySQL Server and RabbitMQ installed locally. Instead,
Docker needs to be installed as the script will start
MySQL and RabbitMQ in Docker containers.

Build
------

You can build the project by running:

```
./gradlew build
```

This automatically downloads Gradle and builds the project, including running the tests.
Make sure that you are running MySQL and RabbitMQ on your host machine before building.

The Gradle build using Maven repositories was provided by
Michael Andrews (Github michaelajr and Twitter @MichaelAJr).
Thanks much!

I hope you benefit from the samples.

Vaughn Vernon
Author: Implementing Domain-Driven Design
Twitter: @VaughnVernon
http://vaughnvernon.co/
