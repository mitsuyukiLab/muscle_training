# 満行研究室 筋力トレーニング

- 主に初心者向けを想定したPythonの練習問題集です.


## トレーニングの仕方の例

1. 手元のPCにGitとDockerがインストールされていることが前提

1. このレポジトリをcloneする
    ```sh
    $ git clone https://github.com/mitsuyukiLab/muscle_training.git
    ```

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
    $ cd muscle_training
    $ docker run --rm --name muscle_training -d -p 8888:8888 -v ${pwd}/menu:/menu -w /menu taiga4112/muscle_training jupyter-lab --no-browser --port=8888 --ip=0.0.0.0 --allow-root --NotebookApp.token='muscle'
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
    $ docker kill muscle_training
    ```