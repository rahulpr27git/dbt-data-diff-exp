
# Docker-compose Instructions

Follow the steps below to run the Docker-compose file:

1. Make sure you have Docker and Docker-compose installed on your system. If not, refer to the official Docker documentation to install these.

2. Download or clone the repository that contains the Docker-compose file.

3. Open terminal and navigate to the directory that contains the Docker-compose file.

4. Run the following command to start all services defined in the Docker-compose file:

```
docker-compose up
```

5. If you want to run it in the background (detached mode), use the following command instead:

```
docker-compose up -d
```

6. To stop all services, run the following command:

```
docker-compose down
```

7. To restart all services without rebuilding them, use:

```
docker-compose stop
docker-compose start
```

8. If you need to rebuild services due to changes in Dockerfiles, use:

```
docker-compose up --build
```

Please, ensure you replace the current directory with your Docker working directory when running the commands.

---

To create and activate a Python virtual environment, please follow the steps:

1. Install pip first if not installed
```
sudo apt-get install python3-pip
```

2. Then install virtual environment using pip
```
pip3 install virtualenv
```

3. Check if installed properly
```
virtualenv --version
```

4. Now create a virtual environment. You can name it anything. I am naming it env.
```
virtualenv env
```

5. Now after creation, you need to activate it
```
source env/bin/activate
```

You will see the name 'env' ahead of the prompt. This indicates that the environment is activated.

---

Remember to replace 'env' with your preferred name of the environment and 'python3' with the python version you prefer (python2.7, python3.5, etc.).


# Installation guide for dbt-postgres and data-diff for postgres

## dbt-postgres

To install dbt-postgres, you can use the pip command as below:

```
pip install dbt-postgres
```

## data-diff

For installing data-diff, use pip again as follows:

```
pip install data-diff 'data-diff[postgres]' -U
```

After these packages are installed, you should be able to use dbt with PostgreSQL and use data-diff for comparing data in your PostgreSQL databases.

---
`Makefile` defaile

- seed:: This runs dbt seed command, which is used to load raw CSV files into your database.

- run:: This runs dbt run command, which is used to transform data in your warehouse from the raw, normalized, semi-structured data in your raw tables, to analysis-ready datasets.

- run_prod:: This is same as the run target, but with an additional -t prod. The -t option allows you to set the name of the target, in this case prod, which the command should run against.

- run_with_diff_stats:: This command does the same as run and then runs data-diff, a tool that can compare data between different databases or different tables in the same database. Then it outputs summary information about differences.

- run_with_diff_stats_json:: This does same as run_with_diff_stats but this time it outputs the statistics about differences in JSON format. The statistics in JSON format can be used by other applications for further processing.

- run_with_diff:: This command first runs dbt run and then data-diff which compares tables, however this command doesn't output any stats unlike run_with_diff_stats or run_with_diff_stats_json targets. It just does the comparison and outputs if any difference exists.