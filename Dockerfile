FROM continuumio/miniconda3:4.12.0

# Clone repo and install dependencies
RUN git clone -b skycamp-tutorial https://github.com/skyplane-project/skyplane && \
    cd skyplane && \
    pip install "git+https://github.com/skyplane-project/skyplane.git@skycamp-tutorial#egg=skyplane[aws]" && \
    cd ../ && \
    git clone https://github.com/ShishirPatil/skyplane-tutorial/ && \
    cd skyplane-tutorial && \
    pip install -r requirements.txt \
    && rm -rf /var/lib/apt/lists/*

CMD jupyter lab --no-browser --ip '*' --allow-root --notebook-dir=/skyplane-tutorial --NotebookApp.token='SkyCamp2022'
