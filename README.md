# 満行研究室 筋力トレーニング

- 主に初心者向けを想定したPythonの練習問題集です.

## トレーニングの仕方の例

1. 手元のPCにGitとDockerがインストールされていることが前提

1. このtemplateレポジトリから自分用repositoryを作成する

    - "Use this template"というボタンが右上(?)にあるはず

1. 作成した自分用repositoryを手元にcloneする

1. Build.

    ```sh
    cd pDESy-jupyterlab
    docker-compose build # --no-cache should be added after updating Dockerfile
    ```

1. Run.

    ```sh
    docker-compose up
    ```

1. Access [http://localhost:8888/](http://localhost:8888/)
    - Default access token is `muscle`. Please change this access token by editing Dockerfile.

1. Down.

    ```sh
    docker-compose down
    ```

---

### その他の方法(参考までに)

1. DockerHubにおいてあるImageを使ってJupyterLabでトレーニングする場合

    - Linux/MacOS

    ```sh
    $ cd muscle_training
    $ docker run --rm --name muscle_training -d -p 8888:8888 \
        -v `pwd`/menu:/menu -w /menu \
        taiga4112/muscle_training \
        jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 \
        --allow-root --NotebookApp.token='muscle'
    ```

    - Windows (Windows Terminal or PowerShell)

    ```sh
    cd muscle_training
    docker run --rm --name muscle_training -d -p 8888:8888 -v ${pwd}/menu:/menu -w /menu taiga4112/muscle_training jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token='muscle'
    ```

    - もし、自分の手元でImageをBuildする場合はこちら

        ```sh
        $ cd muscle_training
        $ docker build -t muscle_training .
        $ docker run --rm --name muscle_training -d -p 8888:8888 \
            -v `pwd`/menu:/menu -w /menu \
            muscle_training \
            jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 \
            --allow-root --NotebookApp.token='muscle'
        ```

1. [http://localhost:8888](http://localhost:8888)へアクセス
    - access tokenは`muscle`です

1. (終わったら)以下のコマンドでkill

    ```sh
    docker kill muscle_training
    ```
