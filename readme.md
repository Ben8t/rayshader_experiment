# Rayshader experiment

Simple commands and environnement (via Docker) to play with the [rayshader package](https://github.com/tylermorganwall/rayshader).

This is the support for an article [published on Medium](https://medium.com/@benoit.pimpaud/rayshader-experiment-e58f09eb91d). 

```
git clone https://gitlab.com/ben8t/rayshader_experiment.git
cd rayshader_experiment
docker build -t rayshader .
docker container run -d --rm -v $(pwd):/home/rstudio/kitematic -p 8787:8787 -e USER=admin -e PASSWORD=root --name rstudio rayshader
```