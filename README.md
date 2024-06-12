# Data Lakehouse 101

Data Lakehouse local stack with PySpark, Trino, and Minio.

## Introduction

In the world of ML and AI, **data** is the crown jewel normally lost in [Swamps](https://www.superannotate.com/blog/data-lakes-vs-data-swamps-vs-data-warehouse) due to bad practices with Data Lakes, when companies try to productionize their data. Data Warehouses are costly solutions for this problem, and increase the complexity of simple Lakes. Here the Data Lakehouses come into action, being a hybrid solution with the best of both worlds ([*](https://2024.pycon.co/en/talks/23)).

**Data Lakehouses** aim to combine elements of data warehousing with core elements of the data lake. Put simply, they are designed to provide the lower costs of cloud storage even for large amounts of raw data alongside support for certain analytics concepts – such as SQL access to curated and structured data tables stored in relational databases, or support for large scale processing of Big Data analytics or machine learning workloads ([*](https://www.exasol.com/resource/data-lake-warehouse-or-lakehouse/)).

This repository aims to introduce the Data Lakehouse pattern as a suitable and flexible solution to transit small companies to established enterprises, allowing to implement a local Data Lakehouse from OpenSource solutions, compatible with Cloud production grade tools.

## Data Lakehouse Components

* Apache Spark<BR/>
  Processing Layer.<BR/>
  [https://spark.apache.org](https://spark.apache.org)

* Minio<BR/>
  Landing buckets and data storage layer.<BR/>
  [https://min.io](https://min.io)

* Apache Hive<BR/>
  To be used as data catalog.<BR/>
  [https://hive.apache.org](https://hive.apache.org)

* Postgres Database<BR/>
  To support the data catalog.<BR/>
  [https://www.postgresql.org](https://www.postgresql.org)

* Trino<BR/>
  Used as a Query engine and data governance.<BR/>
  [https://trino.io](https://trino.io)

* Delta Lake<BR/>
  Open table format used. Click [here](https://www.starburst.io/data-glossary/open-table-formats/) for more information about Open Table Formats.<BR/>
  [https://delta.io](https://delta.io)

## Requirements

* [Git](https://www.atlassian.com/git/tutorials/install-git)
* Make: [Mac](https://formulae.brew.sh/formula/make) | [Windows](https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows)
* [Docker and Docker Composer](https://www.docker.com/products/docker-desktop)
* [wget](https://www.jcchouinard.com/wget-install/)

## Usage

Clone the respository:

```bash
git clone https://github.com/tomkat-cr/lakehouses-101-pycon2024.git
cd lakehouses-101-pycon2024
```

Download the required packages:

```bash
sh ./Scripts/0.download_dependencies.sh
```

**IMPORTANT**: this process will take a long time, depending on your Internet connection speed.

Start the local stack:

```bash
docker-compose up --attach spark
```

Decompress the example data files:

```bash
cd data
unzip moves.zip
unzip pokemon.zip
unzip types.zip
```

Run the local Jupiter engine:

```bash
open http://127.0.0.1:8888/lab
```

### Jupiter notebooks

* [Raygun data ingestion](notebooks/Raygun-data-ingestion.ipynb)

## License

This is a open-sourced software licensed under the [MIT](LICENSE) license.

## Credits

This project is maintained by [Carlos J. Ramirez](https://www.carlosjramirez.com). For more information or to contribute to the project, visit [Data Lakehouse 101 on GitHub](https://github.com/tomkat-cr/lakehouses-101-pycon2024).

Happy Coding!
